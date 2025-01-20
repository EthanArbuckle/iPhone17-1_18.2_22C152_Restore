@interface RequestTransportTypeInformation
- (BOOL)isEqual:(id)a3;
- (NSDictionary)transportTypeInfoProviders;
- (RequestTransportTypeInformation)initWithDictionary:(id)a3;
- (id)requestInfoProviderForTransportType:(int64_t)a3;
- (unint64_t)hash;
@end

@implementation RequestTransportTypeInformation

- (RequestTransportTypeInformation)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (((unint64_t)[v10 integerValue] & 0x8000000000000000) != 0
            || ![v10 integerValue]
            || (uint64_t)[v10 integerValue] > 5)
          {

            goto LABEL_17;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v16.receiver = self;
    v16.super_class = (Class)RequestTransportTypeInformation;
    v11 = [(RequestTransportTypeInformation *)&v16 init];
    if (v11)
    {
      v12 = (NSDictionary *)[v5 copy];
      transportTypeInfoProviders = v11->_transportTypeInfoProviders;
      v11->_transportTypeInfoProviders = v12;
    }
    self = v11;
    v14 = self;
  }
  else
  {

LABEL_17:
    v14 = 0;
  }

  return v14;
}

- (id)requestInfoProviderForTransportType:(int64_t)a3
{
  id v4 = [(RequestTransportTypeInformation *)self transportTypeInfoProviders];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RequestTransportTypeInformation *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else if ([(RequestTransportTypeInformation *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(RequestTransportTypeInformation *)v4 transportTypeInfoProviders];
    id v6 = [(RequestTransportTypeInformation *)self transportTypeInfoProviders];
    unsigned __int8 v7 = [v5 isEqualToDictionary:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(RequestTransportTypeInformation *)self transportTypeInfoProviders];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSDictionary)transportTypeInfoProviders
{
  return self->_transportTypeInfoProviders;
}

- (void).cxx_destruct
{
}

@end