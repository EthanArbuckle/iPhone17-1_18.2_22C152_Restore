@interface ContactsURLParser
+ (OS_os_log)log;
- (CNContactDataSource_Internal)dataSource;
- (ContactsURLParser)initWithURL:(id)a3 dataSource:(id)a4;
- (NSNumber)legacyIdenifier;
- (NSString)identifier;
- (NSURL)url;
- (id)identifierFound;
- (id)identifierFromShowCommandURL:(id)a3;
- (id)legacyIdentifierFound;
- (int64_t)action;
- (int64_t)actionFound;
- (void)readURL:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegacyIdenifier:(id)a3;
@end

@implementation ContactsURLParser

+ (OS_os_log)log
{
  if (qword_100025B48 != -1) {
    dispatch_once(&qword_100025B48, &stru_10001C460);
  }
  v2 = (void *)qword_100025B50;

  return (OS_os_log *)v2;
}

- (ContactsURLParser)initWithURL:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ContactsURLParser;
  v9 = [(ContactsURLParser *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    [(ContactsURLParser *)v10 readURL:v7];
    v11 = v10;
  }

  return v10;
}

- (void)readURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  unsigned __int8 v6 = [v5 isEqualToString:@"contact"];

  if (v6)
  {
    id v7 = [v4 scheme];
    unsigned int v8 = [v7 isEqualToString:@"search"];

    if (v8)
    {
      v9 = [v4 searchResultIdentifier];
      [(ContactsURLParser *)self setLegacyIdenifier:v9];

      [(ContactsURLParser *)self setAction:1];
    }
    v10 = [v4 host];
    unsigned int v11 = [v10 isEqualToString:@"show"];

    if (v11)
    {
      v12 = [(ContactsURLParser *)self identifierFromShowCommandURL:v4];
      [(ContactsURLParser *)self setIdentifier:v12];

      [(ContactsURLParser *)self setAction:1];
    }
    objc_super v13 = [v4 host];
    unsigned int v14 = [v13 isEqualToString:@"edit"];

    if (v14)
    {
      v15 = [(ContactsURLParser *)self identifierFromShowCommandURL:v4];
      [(ContactsURLParser *)self setIdentifier:v15];

      [(ContactsURLParser *)self setAction:2];
    }
    v16 = [v4 host];
    unsigned int v17 = [v16 isEqualToString:@"add"];

    if (v17)
    {
      [(ContactsURLParser *)self setIdentifier:0];
      [(ContactsURLParser *)self setAction:3];
    }
  }
  else
  {
    v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000EFF8(v4, v18);
    }
  }
}

- (id)identifierFromShowCommandURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 host];
  unsigned __int8 v6 = [v4 query];
  id v7 = (char *)[v6 rangeOfString:@"="];
  if (v7)
  {
    unsigned int v8 = v7;
    if (v7 < (char *)[v6 length] - 1)
    {
      v9 = [v6 substringToIndex:v8];
      v10 = [v6 substringFromIndex:v8 + 1];
      if ([v9 isEqualToString:@"id"])
      {
        id v11 = v10;
LABEL_16:

        goto LABEL_17;
      }
      if ([v9 isEqualToString:@"ref"])
      {
        if ([v10 isEqualToString:@"me"])
        {
          v12 = [(ContactsURLParser *)self dataSource];
          id v11 = [v12 preferredForNameMeContactIdentifier];

          goto LABEL_16;
        }
        objc_super v13 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10000F0A8();
        }
      }
      else
      {
        objc_super v13 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10000F110();
        }
      }

      id v11 = 0;
      goto LABEL_16;
    }
  }
  v9 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412802;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v5;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid query '%@' for command '%@' in URL %@.", (uint8_t *)&v15, 0x20u);
  }
  id v11 = 0;
LABEL_17:

  return v11;
}

- (id)identifierFound
{
  return [(ContactsURLParser *)self identifier];
}

- (id)legacyIdentifierFound
{
  return [(ContactsURLParser *)self legacyIdenifier];
}

- (int64_t)actionFound
{
  return [(ContactsURLParser *)self action];
}

- (NSURL)url
{
  return self->_url;
}

- (CNContactDataSource_Internal)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CNContactDataSource_Internal *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)legacyIdenifier
{
  return self->_legacyIdenifier;
}

- (void)setLegacyIdenifier:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyIdenifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_url, 0);
}

@end