@interface SUPreferenceEntry
- (NSString)description;
- (NSString)preferenceKey;
- (SUPreferenceEntry)initWithKey:(id)a3 type:(int64_t)a4 description:(id)a5;
- (int64_t)type;
@end

@implementation SUPreferenceEntry

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (int64_t)type
{
  return self->_type;
}

- (SUPreferenceEntry)initWithKey:(id)a3 type:(int64_t)a4 description:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUPreferenceEntry;
  v11 = [(SUPreferenceEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    if (v9) {
      objc_storeStrong((id *)&v11->_preferenceKey, a3);
    }
    v12->_type = a4;
    if (v10) {
      objc_storeStrong((id *)&v12->_description, a5);
    }
  }

  return v12;
}

- (NSString)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_preferenceKey, 0);
}

@end