@interface _TVRUIUpNextItem
+ (id)itemWithUpNextInfo:(id)a3;
+ (id)moreItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoreItem;
- (TVRCUpNextInfo)upNextInfo;
- (_TVRUIUpNextItem)initWithUpNextInfo:(id)a3;
- (unint64_t)hash;
@end

@implementation _TVRUIUpNextItem

- (_TVRUIUpNextItem)initWithUpNextInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVRUIUpNextItem;
  v6 = [(_TVRUIUpNextItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upNextInfo, a3);
    v7->_isMoreItem = v5 == 0;
  }

  return v7;
}

+ (id)itemWithUpNextInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithUpNextInfo:v4];

  return v5;
}

+ (id)moreItem
{
  v2 = (void *)[objc_alloc((Class)a1) initWithUpNextInfo:0];
  return v2;
}

- (unint64_t)hash
{
  if ([(_TVRUIUpNextItem *)self isMoreItem]) {
    return 1;
  }
  id v4 = [(_TVRUIUpNextItem *)self upNextInfo];
  id v5 = [v4 mediaInfo];
  v6 = [v5 identifier];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (-[_TVRUIUpNextItem isMoreItem](self, "isMoreItem") && ([v6 isMoreItem] & 1) != 0)
      {
        char v7 = 1;
      }
      else
      {
        v8 = [(_TVRUIUpNextItem *)self upNextInfo];
        objc_super v9 = [v8 mediaInfo];
        v10 = [v9 identifier];
        v11 = [v6 upNextInfo];
        v12 = [v11 mediaInfo];
        v13 = [v12 identifier];
        char v7 = [v10 isEqualToString:v13];
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (BOOL)isMoreItem
{
  return self->_isMoreItem;
}

- (void).cxx_destruct
{
}

@end