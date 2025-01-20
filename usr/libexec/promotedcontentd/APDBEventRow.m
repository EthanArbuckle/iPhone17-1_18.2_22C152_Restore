@interface APDBEventRow
- (NSArray)branch;
- (NSArray)environment;
- (NSData)internalPropertiesData;
- (NSData)propertiesData;
- (NSDictionary)internalProperties;
- (NSDictionary)properties;
- (NSNumber)insertOrder;
- (NSString)branchString;
- (NSString)environmentString;
- (id)initHandle:(id)a3 timestamp:(id)a4 event:(id)a5 impression:(id)a6 insertOrder:(id)a7 table:(id)a8;
- (id)initHandle:(id)a3 timestamp:(id)a4 purpose:(id)a5 event:(id)a6 source:(id)a7 unknownSource:(id)a8 handleSet:(id)a9 eventOrder:(id)a10 trace:(id)a11 branch:(id)a12 environment:(id)a13 impression:(id)a14 properties:(id)a15 internalProperties:(id)a16 insertOrder:(id)a17 table:(id)a18;
- (id)readOnlyColumns;
- (void)setBranch:(id)a3;
- (void)setBranchString:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setEnvironmentString:(id)a3;
- (void)setInsertOrder:(id)a3;
- (void)setInternalProperties:(id)a3;
- (void)setInternalPropertiesData:(id)a3;
- (void)setProperties:(id)a3;
- (void)setPropertiesData:(id)a3;
@end

@implementation APDBEventRow

- (id)readOnlyColumns
{
  v3 = +[NSSet setWithObjects:@"branch", @"environment", 0];
  v7.receiver = self;
  v7.super_class = (Class)APDBEventRow;
  v4 = [(APDBEventRow *)&v7 readOnlyColumns];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (id)initHandle:(id)a3 timestamp:(id)a4 purpose:(id)a5 event:(id)a6 source:(id)a7 unknownSource:(id)a8 handleSet:(id)a9 eventOrder:(id)a10 trace:(id)a11 branch:(id)a12 environment:(id)a13 impression:(id)a14 properties:(id)a15 internalProperties:(id)a16 insertOrder:(id)a17 table:(id)a18
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  v27 = v26;
  id v41 = a10;
  v28 = v25;
  id v40 = a11;
  v29 = v24;
  id v39 = a12;
  id v30 = a13;
  id v31 = a14;
  id v32 = a15;
  id v33 = a16;
  id v34 = a17;
  v45.receiver = self;
  v45.super_class = (Class)APDBEventRow;
  id v35 = [(APDBEventRow *)&v45 initAsNewObjectWithTable:a18];
  v36 = v35;
  if (v35)
  {
    [v35 setValue:v23 forColumnName:@"handle"];
    [v36 setValue:v29 forColumnName:@"timestamp"];
    [v36 setValue:v28 forColumnName:@"purpose"];
    [v36 setValue:v27 forColumnName:@"event"];
    [v36 setValue:v44 forColumnName:@"source"];
    [v36 setValue:v43 forColumnName:@"unknownSource"];
    [v36 setValue:v42 forColumnName:@"handleSet"];
    [v36 setValue:v41 forColumnName:@"eventOrder"];
    [v36 setValue:v40 forColumnName:@"trace"];
    [v36 setBranch:v39];
    [v36 setEnvironment:v30];
    [v36 setValue:v31 forColumnName:@"impression"];
    [v36 setProperties:v32];
    [v36 setInternalProperties:v33];
    [v36 setValue:v34 forColumnName:@"insertOrder"];
  }

  return v36;
}

- (id)initHandle:(id)a3 timestamp:(id)a4 event:(id)a5 impression:(id)a6 insertOrder:(id)a7 table:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)APDBEventRow;
  id v19 = [(APDBEventRow *)&v22 initAsNewObjectWithTable:a8];
  v20 = v19;
  if (v19)
  {
    [v19 setValue:v14 forColumnName:@"handle"];
    [v20 setValue:v15 forColumnName:@"timestamp"];
    [v20 setValue:v16 forColumnName:@"event"];
    [v20 setValue:v17 forColumnName:@"impression"];
    [v20 setValue:v18 forColumnName:@"insertOrder"];
  }

  return v20;
}

- (void)setBranch:(id)a3
{
  id v4 = [a3 componentsJoinedByString:@"|"];
  [(APDBEventRow *)self setValue:v4 forColumnName:@"branchString"];
}

- (NSArray)branch
{
  v2 = [(APDBEventRow *)self valueForColumnName:@"branchString"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 componentsSeparatedByString:@"|"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setEnvironment:(id)a3
{
  id v4 = [a3 componentsJoinedByString:@"|"];
  [(APDBEventRow *)self setValue:v4 forColumnName:@"environmentString"];
}

- (NSArray)environment
{
  v2 = [(APDBEventRow *)self valueForColumnName:@"environmentString"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 componentsSeparatedByString:@"|"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSDictionary)properties
{
  return (NSDictionary *)[(APDBEventRow *)self dictionaryFromBlobForColumnName:@"propertiesData"];
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)internalProperties
{
  return (NSDictionary *)[(APDBEventRow *)self dictionaryFromBlobForColumnName:@"internalPropertiesData"];
}

- (void)setInternalProperties:(id)a3
{
}

- (NSNumber)insertOrder
{
  return self->_insertOrder;
}

- (void)setInsertOrder:(id)a3
{
}

- (NSData)propertiesData
{
  return self->_propertiesData;
}

- (void)setPropertiesData:(id)a3
{
}

- (NSData)internalPropertiesData
{
  return self->_internalPropertiesData;
}

- (void)setInternalPropertiesData:(id)a3
{
}

- (NSString)branchString
{
  return self->_branchString;
}

- (void)setBranchString:(id)a3
{
}

- (NSString)environmentString
{
  return self->_environmentString;
}

- (void)setEnvironmentString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentString, 0);
  objc_storeStrong((id *)&self->_branchString, 0);
  objc_storeStrong((id *)&self->_internalPropertiesData, 0);
  objc_storeStrong((id *)&self->_propertiesData, 0);

  objc_storeStrong((id *)&self->_insertOrder, 0);
}

@end