@interface _UIResponder_Override_Host_Entry
+ (id)entryWithResponder:(id)a3 forType:(int64_t)a4;
- (UIResponder)overridden;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation _UIResponder_Override_Host_Entry

+ (id)entryWithResponder:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v7 = (void *)v6;
  if (v6)
  {
    objc_storeWeak((id *)(v6 + 8), v5);
    v7[2] = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&self->_overridden);
  unint64_t v4 = self->_type ^ WeakRetained;

  return v4;
}

- (id)description
{
  v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overridden);
  id v5 = NSStringFrom_UI_UIResponder_Override_Type(self->_type);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ = %@>", WeakRetained, v5];

  return v6;
}

- (UIResponder)overridden
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overridden);
  return (UIResponder *)WeakRetained;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end