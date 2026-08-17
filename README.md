# Canada Population Interactive Map
🚀 **[Click Here to Launch the Live Interactive Map](https://bit.ly/4qldSpb)**
## Overview
This interactive GIS web application visualizes demographic trends and population changes across Canadian Census Metropolitan Areas (CMAs) between 2016 and 2021. 

By combining automated **SPSS syntax routines** with **ArcGIS Online**, raw Statistics Canada census data was cleaned, joined, and transformed into an intuitive, interactive web map.

### Key Features & Scope
* **Data Integration:** Multi-year StatCan demographic tables merged in SPSS using standardized geocodes (`ALT_GEO_CODE`).
* **Custom Layer Control:** Features an exclusive visibility layer group allowing users to seamlessly switch between 2016 Population, 2021 Population, and 2016–2021 Population Change views.
* **Interactive Data Exploration:** Includes interactive pop-up cards for quick city summaries, live attribute tables, and spatial search functionality.
* **Urban Focus:** Highlights demographic shifts across major urban centers meeting the 50,000+ population threshold.
### Data Cleaning
The census dataset was downloaded from Statistics Canada, then SPSS was used to clean the data. First, I filtered out the data entries so that it only had the 2021 populations across Canada. Next, I changed the variable name from C1_COUNT_2016 to C1_COUNT_TOTAL for shorten the name. I then formatted the variable C1_COUNT_TOTAL to add commas for better visualization (1000 vs 1,000). The same thing was done for 2021. Next, I merged the data for 2016 and 2021 by the variable ALT_GEO_CODE. Then a new variable CHANGE_POP was created which was the difference in population between 2016 and 2021. The merged file was named SPSS_Project_StatCan-MERGE.sav. Since there were too many cities to show on a graph, I filtered out so that only the ones with a population over 500,000 were included. A new variable COMPUTE YEAR = 2016 was created from the file SPSS_Project_StatCan-2016-02.sav. 
<img width="920" height="499" alt="Screenshot 2026-08-17 at 5 31 44 AM" src="https://github.com/user-attachments/assets/f211d797-c098-45dd-a03a-8ea22eeb669c" />
The same was done for 2021 population. 
<img width="893" height="497" alt="Screenshot 2026-08-17 at 5 31 56 AM" src="https://github.com/user-attachments/assets/6aeabc87-0c78-4f64-9821-365cd544c406" />
From the two files SPSS_Project_StatCan-2016-02.sav and SPSS_Project_StatCan-2021-02.sav, a top-down merge was executed and was sorted by GEO_NAME and YEAR in ascending order, and the file SPSS_Project_StatCan-BY_YEAR.sav was created. It was filtereed to only have populations over 500,000 as well. 
<img width="757" height="507" alt="Screenshot 2026-08-17 at 5 32 05 AM" src="https://github.com/user-attachments/assets/d332a88f-6260-4f05-aeaa-c0622e092636" />
Using the same merged file, I sorted out the population changes that had over 50,000 and sorted the variable GEO_NAME in acsending order. Then finally, I exported the SPSS into a csv file to import into ArcGIS to make the interactive map. 
<img width="884" height="494" alt="Screenshot 2026-08-17 at 5 32 15 AM" src="https://github.com/user-attachments/assets/7210e242-106a-4268-83dc-9b37112fd15f" />
