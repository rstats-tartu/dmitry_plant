# Dmitry_plant

The goal of Dmitry_plant is to understand the effect of stomatata opening on the plant growth at different environmental conditions.

## Data description
Data is saved into **data** folder.

- **fc_plant.csv** – photosynthesis data (derived from 'Fc_Plant.xls').
    - QY_max - max quantum yield of PSII.
    - Time course – 8 timepoints
    - Position – in the tray ABCD, not important – exclude 2 points from position – named "empty"
    - Plant name – treatment name LT – low temp, HW – high water LL-low light, LC - low C02
    - 70 plants, 8 timepoints, each plant measured once in each timepoint.
    - Stomata opening – genotype column col0 – wt, 3 mutants with more close stomatas ht1-2, ht1-4, ht1-5
    - In each exp combinations of LW and HW combined with HL & LL – 4 combinations.
    - Whether any of mutants differ from wt in any
    - Also 2 lines with open stomata – MES5, MES7 – these also in comparison with wt.
    - Y – yield of PSII;

- **ir_plant.csv** is derived from 'Ir_Plant.xls'
    - Y -- Temp-avg. Same plants, same timepoints (4 timepoints).

- **morpho.csv** is derived from 'Rgb_Morpho.xlsx'
    - Y -- area_mm

- **scales_measure.csv** is derived from 'ScalesMeasure.xlsx'
    - Y -- weight (g)
