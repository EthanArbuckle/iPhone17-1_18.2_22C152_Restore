@interface SFUITTRReportComponent
+ (id)peopleSuggesterComponent;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (SFUITTRReportComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SFUITTRReportComponent

+ (id)peopleSuggesterComponent
{
  v2 = [[SFUITTRReportComponent alloc] initWithIdentifier:@"655674" name:@"CoreDuet" version:@"PeopleSuggester"];
  return v2;
}

- (SFUITTRReportComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFUITTRReportComponent;
  v11 = [(SFUITTRReportComponent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    version = v11->_version;
    v11->_version = (NSString *)v16;
  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end