@interface PPConnectionsAddressFormatter
+ (BOOL)isValidAddressDictionary:(id)a3;
+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forAddress:(id)a4 duetEvent:(id)a5;
+ (id)addressDictionaryFromAttributeSet:(id)a3;
+ (id)formattedAddressWithLocationField:(unsigned __int8)a3 address:(id)a4 duetEvent:(id)a5 shortStyle:(BOOL)a6;
+ (id)formattedCityAndStateWithCity:(id)a3 state:(id)a4;
+ (id)formattedStreetNameWithThoroughfare:(id)a3 subThoroughfare:(id)a4;
+ (id)postalAddressFromAttributeSet:(id)a3;
+ (id)postalAddressFromDuetEvent:(id)a3;
+ (id)singleLineFormattedAddressWithPostalAddress:(id)a3 shortStyle:(BOOL)a4;
@end

@implementation PPConnectionsAddressFormatter

+ (id)addressDictionaryFromAttributeSet:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [(id)objc_opt_class() postalAddressFromAttributeSet:v3];
  v6 = +[PPConnectionsAddressFormatter singleLineFormattedAddressWithPostalAddress:v5 shortStyle:0];

  if ([v6 length])
  {
    v26[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v4 setObject:v7 forKeyedSubscript:@"FormattedAddressLines"];
  }
  v25 = v6;
  v8 = [v3 subThoroughfare];
  v9 = PPCollapseWhitespaceAndStrip();

  if ([v9 length]) {
    [v4 setObject:v9 forKeyedSubscript:@"SubThoroughfare"];
  }
  v10 = [v3 thoroughfare];
  v11 = PPCollapseWhitespaceAndStrip();

  if ([v11 length]) {
    [v4 setObject:v11 forKeyedSubscript:@"Thoroughfare"];
  }
  v12 = [v3 postalCode];
  v13 = PPCollapseWhitespaceAndStrip();

  if ([v13 length]) {
    [v4 setObject:v13 forKeyedSubscript:@"ZIP"];
  }
  v14 = [v3 city];
  v15 = PPCollapseWhitespaceAndStrip();

  if ([v15 length]) {
    [v4 setObject:v15 forKeyedSubscript:@"City"];
  }
  v16 = [v3 stateOrProvince];
  v17 = PPCollapseWhitespaceAndStrip();

  if ([v17 length]) {
    [v4 setObject:v17 forKeyedSubscript:@"State"];
  }
  v18 = [v3 country];
  v19 = PPCollapseWhitespaceAndStrip();

  if ([v19 length]) {
    [v4 setObject:v19 forKeyedSubscript:@"Country"];
  }
  v20 = [v3 namedLocation];
  v21 = PPCollapseWhitespaceAndStrip();

  if ([v21 length]) {
    [v4 setObject:v21 forKeyedSubscript:@"Name"];
  }
  if ([v4 count]) {
    v22 = v4;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  return v23;
}

+ (id)formattedAddressWithLocationField:(unsigned __int8)a3 address:(id)a4 duetEvent:(id)a5 shortStyle:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_opt_class();
  if (v8 == 1) {
    [v11 singleLineFormattedAddressWithPostalAddress:v10 shortStyle:v6];
  }
  else {
  v12 = [v11 addressComponentValueWithLocationField:v8 forAddress:v10 duetEvent:v9];
  }

  return v12;
}

+ (id)postalAddressFromAttributeSet:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_class();
  BOOL v6 = [v3 thoroughfare];
  v7 = [v3 subThoroughfare];
  uint64_t v8 = [v5 formattedStreetNameWithThoroughfare:v6 subThoroughfare:v7];
  [v4 setStreet:v8];

  id v9 = [v3 city];
  id v10 = PPCollapseWhitespaceAndStrip();
  [v4 setCity:v10];

  v11 = [v3 postalCode];
  v12 = PPCollapseWhitespaceAndStrip();
  [v4 setPostalCode:v12];

  v13 = [v3 stateOrProvince];
  v14 = PPCollapseWhitespaceAndStrip();
  [v4 setState:v14];

  v15 = [v3 country];

  v16 = PPCollapseWhitespaceAndStrip();
  [v4 setCountry:v16];

  return v4;
}

+ (id)postalAddressFromDuetEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:a1 file:@"PPConnectionsAddressFormatter.m" lineNumber:156 description:@"_DKEvent is nil"];
  }
  BOOL v6 = objc_opt_class();
  v7 = [v5 metadata];
  uint64_t v8 = [MEMORY[0x1E4F5B570] thoroughfare];
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [v5 metadata];
  v11 = [MEMORY[0x1E4F5B570] subThoroughfare];
  v12 = [v10 objectForKeyedSubscript:v11];
  v13 = [v6 formattedStreetNameWithThoroughfare:v9 subThoroughfare:v12];

  v14 = objc_opt_new();
  [v14 setStreet:v13];
  v15 = [v5 metadata];
  v16 = [MEMORY[0x1E4F5B570] city];
  v17 = [v15 objectForKeyedSubscript:v16];
  v18 = PPCollapseWhitespaceAndStrip();
  [v14 setCity:v18];

  v19 = [v5 metadata];
  v20 = [MEMORY[0x1E4F5B570] postalCode];
  v21 = [v19 objectForKeyedSubscript:v20];
  v22 = PPCollapseWhitespaceAndStrip();
  [v14 setPostalCode:v22];

  id v23 = [v5 metadata];
  v24 = [MEMORY[0x1E4F5B570] stateOrProvince];
  v25 = [v23 objectForKeyedSubscript:v24];
  v26 = PPCollapseWhitespaceAndStrip();
  [v14 setState:v26];

  v27 = [v5 metadata];
  v28 = [MEMORY[0x1E4F5B570] country];
  v29 = [v27 objectForKeyedSubscript:v28];
  v30 = PPCollapseWhitespaceAndStrip();
  [v14 setCountry:v30];

  return v14;
}

+ (id)singleLineFormattedAddressWithPostalAddress:(id)a3 shortStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (v4)
  {
    BOOL v6 = objc_opt_new();
    v7 = [v5 street];
    [v6 setStreet:v7];

    uint64_t v8 = [v5 city];
    [v6 setCity:v8];
  }
  id v9 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v6 addCountryName:0];
  id v10 = PPCollapseWhitespaceAndStrip();

  return v10;
}

+ (id)formattedCityAndStateWithCity:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length")) {
    id v7 = (id)[[NSString alloc] initWithFormat:@"%@, %@", v5, v6];
  }
  else {
    id v7 = v5;
  }
  uint64_t v8 = v7;
  id v9 = PPCollapseWhitespaceAndStrip();

  return v9;
}

+ (id)formattedStreetNameWithThoroughfare:(id)a3 subThoroughfare:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length") && !objc_msgSend(v5, "hasPrefix:", v6)) {
    id v7 = (id)[[NSString alloc] initWithFormat:@"%@ %@", v6, v5];
  }
  else {
    id v7 = v5;
  }
  uint64_t v8 = v7;
  id v9 = PPCollapseWhitespaceAndStrip();

  return v9;
}

+ (BOOL)isValidAddressDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"Thoroughfare"];
  if (!v5)
  {
    id v3 = [v4 objectForKeyedSubscript:@"Street"];
    if (!v3)
    {
      BOOL v7 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v6 = [v4 objectForKeyedSubscript:@"ZIP"];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"City"];
    BOOL v7 = v8 != 0;
  }
  if (!v5) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forAddress:(id)a4 duetEvent:(id)a5
{
  int v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  id v10 = 0;
  switch(v6)
  {
    case 2:
      v11 = [v8 metadata];
      v12 = [MEMORY[0x1E4F5B570] locationName];
      v13 = [v11 objectForKeyedSubscript:v12];
      id v10 = PPCollapseWhitespaceAndStrip();
      goto LABEL_11;
    case 3:
      uint64_t v14 = [v7 street];
      goto LABEL_9;
    case 4:
      uint64_t v14 = [v7 city];
      goto LABEL_9;
    case 5:
      uint64_t v14 = [v7 postalCode];
      goto LABEL_9;
    case 6:
      uint64_t v14 = [v7 state];
      goto LABEL_9;
    case 7:
      v15 = objc_opt_class();
      v11 = [v7 city];
      v12 = [v7 state];
      id v10 = [v15 formattedCityAndStateWithCity:v11 state:v12];
      goto LABEL_12;
    case 9:
      uint64_t v14 = [v7 country];
LABEL_9:
      v11 = (void *)v14;
      id v10 = PPCollapseWhitespaceAndStrip();
      goto LABEL_13;
    case 10:
      v11 = [v8 metadata];
      v12 = [MEMORY[0x1E4F5B570] phoneNumbers];
      v13 = [v11 objectForKeyedSubscript:v12];
      v16 = [v13 firstObject];
      id v10 = PPCollapseWhitespaceAndStrip();

LABEL_11:
LABEL_12:

LABEL_13:
      break;
    default:
      break;
  }

  return v10;
}

@end