@interface NTKFaceSlotComplicationDetailListProviderStringSectionInfo
- (BOOL)isEqual:(id)a3;
- (NSString)groupName;
- (NSString)ntk_identifier;
- (NSString)ntk_localizedSectionName;
- (NTKFaceSlotComplicationDetailListProviderStringSectionInfo)initWithGroupName:(id)a3;
- (unint64_t)hash;
@end

@implementation NTKFaceSlotComplicationDetailListProviderStringSectionInfo

- (NTKFaceSlotComplicationDetailListProviderStringSectionInfo)initWithGroupName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceSlotComplicationDetailListProviderStringSectionInfo;
  v5 = [(NTKFaceSlotComplicationDetailListProviderStringSectionInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F1635E90;
    }
    objc_storeStrong((id *)&v5->_groupName, v8);
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_groupName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 groupName];
    if (v5 == self->_groupName)
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v6 = [v4 groupName];
      char v7 = [v6 isEqual:self->_groupName];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)ntk_identifier
{
  return self->_groupName;
}

- (NSString)ntk_localizedSectionName
{
  return self->_groupName;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
}

@end