@interface NMRProtobufSerialization
- (Class)protobufClass;
- (NSDictionary)dictionaryKeyToProtobufKeyMapping;
- (id)dictionaryFromProtobuf:(id)a3;
- (id)dictionaryFromProtobufData:(id)a3;
- (id)dictionaryValueToProtobufValueTransformer;
- (id)protobufDataFromDictionary:(id)a3;
- (id)protobufFromDictionary:(id)a3;
- (id)protobufValueToDictionaryValueTransformer;
- (void)setDictionaryKeyToProtobufKeyMapping:(id)a3;
- (void)setDictionaryValueToProtobufValueTransformer:(id)a3;
- (void)setProtobufClass:(Class)a3;
- (void)setProtobufValueToDictionaryValueTransformer:(id)a3;
@end

@implementation NMRProtobufSerialization

- (void)setDictionaryKeyToProtobufKeyMapping:(id)a3
{
  v5 = (NSDictionary *)a3;
  if (self->_dictionaryKeyToProtobufKeyMapping != v5)
  {
    objc_storeStrong((id *)&self->_dictionaryKeyToProtobufKeyMapping, a3);
    id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count")];
    dictionaryKeyToProtobufKeyMapping = self->_dictionaryKeyToProtobufKeyMapping;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100027A00;
    v11[3] = &unk_100045440;
    v8 = (NSDictionary *)v6;
    v12 = v8;
    [(NSDictionary *)dictionaryKeyToProtobufKeyMapping enumerateKeysAndObjectsUsingBlock:v11];
    protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
    self->_protobufKeyToDictionaryKeyMapping = v8;
    v10 = v8;
  }
}

- (id)dictionaryFromProtobuf:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count")];
  protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027B00;
  v12[3] = &unk_100045468;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [(NSDictionary *)protobufKeyToDictionaryKeyMapping enumerateKeysAndObjectsUsingBlock:v12];
  v9 = v15;
  id v10 = v7;

  return v10;
}

- (id)dictionaryFromProtobufData:(id)a3
{
  protobufClass = self->_protobufClass;
  id v5 = a3;
  id v6 = [[protobufClass alloc] initWithData:v5];

  id v7 = [(NMRProtobufSerialization *)self dictionaryFromProtobuf:v6];

  return v7;
}

- (id)protobufFromDictionary:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027D04;
  v8[3] = &unk_100045490;
  v8[4] = self;
  id v9 = a3;
  id v3 = (id)objc_opt_new();
  id v10 = v3;
  id v4 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v5 = v10;
  id v6 = v3;

  return v6;
}

- (id)protobufDataFromDictionary:(id)a3
{
  id v3 = [(NMRProtobufSerialization *)self protobufFromDictionary:a3];
  id v4 = [v3 data];

  return v4;
}

- (NSDictionary)dictionaryKeyToProtobufKeyMapping
{
  return self->_dictionaryKeyToProtobufKeyMapping;
}

- (Class)protobufClass
{
  return self->_protobufClass;
}

- (void)setProtobufClass:(Class)a3
{
}

- (id)dictionaryValueToProtobufValueTransformer
{
  return self->_dictionaryValueToProtobufValueTransformer;
}

- (void)setDictionaryValueToProtobufValueTransformer:(id)a3
{
}

- (id)protobufValueToDictionaryValueTransformer
{
  return self->_protobufValueToDictionaryValueTransformer;
}

- (void)setProtobufValueToDictionaryValueTransformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_protobufValueToDictionaryValueTransformer, 0);
  objc_storeStrong(&self->_dictionaryValueToProtobufValueTransformer, 0);
  objc_storeStrong((id *)&self->_protobufClass, 0);
  objc_storeStrong((id *)&self->_dictionaryKeyToProtobufKeyMapping, 0);

  objc_storeStrong((id *)&self->_protobufKeyToDictionaryKeyMapping, 0);
}

@end