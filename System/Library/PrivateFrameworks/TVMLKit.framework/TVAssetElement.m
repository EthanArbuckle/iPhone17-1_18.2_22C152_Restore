@interface TVAssetElement
- (BOOL)isEqual:(id)a3;
- (NSNumber)persistentID;
- (NSNumber)rentalAdamID;
- (NSString)actionParams;
- (NSString)adamID;
- (NSURL)extrasURL;
- (NSURL)url;
- (unint64_t)keyDelivery;
- (unint64_t)type;
@end

@implementation TVAssetElement

- (NSString)actionParams
{
  v2 = [(TVAssetElement *)self assetElement];
  v3 = [v2 actionParams];

  return (NSString *)v3;
}

- (NSString)adamID
{
  v2 = [(TVAssetElement *)self assetElement];
  v3 = [v2 adamID];

  return (NSString *)v3;
}

- (NSURL)extrasURL
{
  v2 = [(TVAssetElement *)self assetElement];
  v3 = [v2 extrasURL];

  return (NSURL *)v3;
}

- (unint64_t)keyDelivery
{
  v2 = [(TVAssetElement *)self assetElement];
  uint64_t v3 = [v2 keyDelivery];

  return v3 == 1;
}

- (NSNumber)persistentID
{
  v2 = [(TVAssetElement *)self assetElement];
  uint64_t v3 = [v2 persistentID];

  return (NSNumber *)v3;
}

- (NSNumber)rentalAdamID
{
  v2 = [(TVAssetElement *)self assetElement];
  uint64_t v3 = [v2 rentalAdamID];

  return (NSNumber *)v3;
}

- (unint64_t)type
{
  v2 = [(TVAssetElement *)self assetElement];
  uint64_t v3 = [v2 type];

  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (NSURL)url
{
  v2 = [(TVAssetElement *)self assetElement];
  uint64_t v3 = [v2 url];

  return (NSURL *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  v5 = [(TVAssetElement *)self actionParams];
  if (v5)
  {

LABEL_5:
    v7 = [(TVAssetElement *)self actionParams];
    v8 = [v4 actionParams];
    int v9 = [v7 isEqualToString:v8];

    goto LABEL_6;
  }
  v6 = [v4 actionParams];

  if (v6) {
    goto LABEL_5;
  }
  int v9 = 1;
LABEL_6:
  v10 = [(TVAssetElement *)self adamID];
  if (v10)
  {

    if ((v9 & 1) == 0)
    {
      int v11 = 0;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v12 = [v4 adamID];

  if (v12) {
    int v11 = 0;
  }
  else {
    int v11 = v9;
  }
  if (v12 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_14:
    v13 = [(TVAssetElement *)self adamID];
    v14 = [v4 adamID];
    int v11 = [v13 isEqualToString:v14];
  }
LABEL_15:
  v15 = [(TVAssetElement *)self url];
  if (v15)
  {

    if ((v11 & 1) == 0)
    {
      int v16 = 0;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v17 = [v4 url];

  if (v17) {
    int v16 = 0;
  }
  else {
    int v16 = v11;
  }
  if (v17 && ((v11 ^ 1) & 1) == 0)
  {
LABEL_23:
    v18 = [(TVAssetElement *)self url];
    v19 = [v4 url];
    int v16 = [v18 isEqual:v19];
  }
LABEL_24:
  v20 = [(TVAssetElement *)self persistentID];
  if (v20)
  {

    if ((v16 & 1) == 0)
    {
      int v21 = 0;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v22 = [v4 persistentID];

  if (v22) {
    int v21 = 0;
  }
  else {
    int v21 = v16;
  }
  if (v22 && ((v16 ^ 1) & 1) == 0)
  {
LABEL_32:
    v23 = [(TVAssetElement *)self persistentID];
    v24 = [v4 persistentID];
    int v21 = [v23 isEqual:v24];
  }
LABEL_33:
  v25 = [(TVAssetElement *)self rentalAdamID];
  if (v25)
  {

LABEL_36:
    if (!v21) {
      goto LABEL_43;
    }
    v27 = [(TVAssetElement *)self rentalAdamID];
    v28 = [v4 rentalAdamID];
    char v29 = [v27 isEqual:v28];

    if ((v29 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  v26 = [v4 rentalAdamID];

  if (v26) {
    goto LABEL_36;
  }
  if (!v21)
  {
LABEL_43:
    BOOL v32 = 0;
    goto LABEL_44;
  }
LABEL_41:
  unint64_t v30 = [(TVAssetElement *)self keyDelivery];
  if (v30 != [v4 keyDelivery]) {
    goto LABEL_43;
  }
  unint64_t v31 = [(TVAssetElement *)self type];
  BOOL v32 = v31 == [v4 type];
LABEL_44:

  return v32;
}

@end