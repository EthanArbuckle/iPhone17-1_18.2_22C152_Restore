@interface MTOptionSetting
- (MTOptionsDescription)options;
- (NSAttributedString)footerText;
- (NSString)headerTitle;
- (id)currentShortTitle;
- (id)menuForOptions;
- (id)reloadHandler;
- (void)setFooterText:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReloadHandler:(id)a3;
@end

@implementation MTOptionSetting

- (id)currentShortTitle
{
  options = self->_options;
  v4 = [(MTSetting *)self value];
  id v5 = -[MTOptionsDescription indexForValue:](options, "indexForValue:", [v4 unsignedIntegerValue]);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  v6 = [(MTOptionsDescription *)self->_options shortTitles];
  v7 = [v6 objectAtIndex:v5];

  return v7;
}

- (id)menuForOptions
{
  v20 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(MTOptionSetting *)self options];
  id obj = [v3 valueSet];

  id v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v8 = [(MTOptionSetting *)self options];
        id v9 = [v8 indexForValue:[v7 integerValue]];

        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = [(MTOptionSetting *)self options];
          v11 = [v10 valueSet];
          BOOL v12 = v9 < [v11 count];

          if (v12)
          {
            v13 = [(MTOptionSetting *)self options];
            v14 = [v13 longTitles];
            v15 = [v14 objectAtIndexedSubscript:v9];

            objc_initWeak(&location, self);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100128E2C;
            v22[3] = &unk_1005525C0;
            objc_copyWeak(&v23, &location);
            v22[4] = v7;
            v16 = +[UIAction actionWithTitle:v15 image:0 identifier:0 handler:v22];
            v17 = [(MTSetting *)self value];
            [v16 setState:[v7 isEqualToNumber:v17]];

            [v20 addObject:v16];
            objc_destroyWeak(&v23);
            objc_destroyWeak(&location);
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  v18 = +[UIMenu menuWithTitle:&stru_10056A8A0 children:v20];

  return v18;
}

- (MTOptionsDescription)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSAttributedString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end