@interface UIOpenURLContext
- (BOOL)isEqual:(id)a3;
- (NSDictionary)URLOptionsDictionary;
- (NSDictionary)optionsDictionary;
- (NSURL)URL;
- (UIOpenURLContext)initWithURL:(id)a3 options:(id)a4;
- (UISceneOpenURLOptions)options;
- (id)description;
- (unint64_t)hash;
@end

@implementation UIOpenURLContext

- (UIOpenURLContext)initWithURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIOpenURLContext;
  v8 = [(UIOpenURLContext *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIOpenURLContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
    goto LABEL_13;
  }
  id v6 = v4;
  id v7 = objc_opt_class();
  if (![v7 isEqual:objc_opt_class()]) {
    goto LABEL_10;
  }
  unint64_t v8 = [(UIOpenURLContext *)self hash];
  if (v8 != [(UIOpenURLContext *)v6 hash]) {
    goto LABEL_10;
  }
  URL = self->_URL;
  if (URL != v6->_URL && (!URL || !-[NSURL isEqual:](URL, "isEqual:"))) {
    goto LABEL_10;
  }
  options = self->_options;
  if (options == v6->_options)
  {
    char v11 = 1;
    goto LABEL_11;
  }
  if (options) {
    char v11 = -[UISceneOpenURLOptions isEqual:](options, "isEqual:");
  }
  else {
LABEL_10:
  }
    char v11 = 0;
LABEL_11:

LABEL_13:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_URL hash];
  return [(UISceneOpenURLOptions *)self->_options hash] ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; URL: %@; options: %@>",
               objc_opt_class(),
               self,
               self->_URL,
               self->_options);
}

- (NSDictionary)URLOptionsDictionary
{
  v2 = [(UIOpenURLContext *)self options];
  uint64_t v3 = _dictionaryFromUISceneOpenURLOptions(v2);

  return (NSDictionary *)v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (UISceneOpenURLOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSDictionary)optionsDictionary
{
  v2 = [(UIOpenURLContext *)self options];
  uint64_t v3 = _dictionaryFromUISceneOpenURLOptions(v2);

  return (NSDictionary *)v3;
}

@end