select
    zipcode,
    state_abbr,
    state_name
from read_csv_auto('raw_data/zipcode_state_mapping.csv', header=True)