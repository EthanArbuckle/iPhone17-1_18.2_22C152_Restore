@interface NTKTopLevelSectionInfo
- (BOOL)isEqual:(id)a3;
- (NSString)ntk_identifier;
- (NSString)ntk_localizedSectionName;
- (NTKTopLevelSectionInfo)initWithIdentifier:(id)a3 localizedSectionName:(id)a4;
- (unint64_t)hash;
- (void)setNtk_identifier:(id)a3;
- (void)setNtk_localizedSectionName:(id)a3;
@end

@implementation NTKTopLevelSectionInfo

- (NTKTopLevelSectionInfo)initWithIdentifier:(id)a3 localizedSectionName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKTopLevelSectionInfo;
  v9 = [(NTKTopLevelSectionInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ntk_identifier, a3);
    objc_storeStrong((id *)&v10->_ntk_localizedSectionName, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_ntk_identifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_ntk_identifier hash];
}

- (NSString)ntk_identifier
{
  return self->_ntk_identifier;
}

- (void)setNtk_identifier:(id)a3
{
}

- (NSString)ntk_localizedSectionName
{
  return self->_ntk_localizedSectionName;
}

- (void)setNtk_localizedSectionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ntk_localizedSectionName, 0);
  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end