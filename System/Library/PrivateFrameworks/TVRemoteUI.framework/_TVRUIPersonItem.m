@interface _TVRUIPersonItem
+ (id)itemWithFactoidItem:(id)a3;
+ (id)itemWithMediaInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isFactoid;
- (BOOL)isMediaInfo;
- (NSUUID)identifier;
- (TVRCMediaInfo)mediaInfo;
- (_TVRUIFactoidItem)factoidItem;
- (_TVRUIPersonItem)initWithFactoidItem:(id)a3 mediaInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIsExpanded:(BOOL)a3;
@end

@implementation _TVRUIPersonItem

- (_TVRUIPersonItem)initWithFactoidItem:(id)a3 mediaInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TVRUIPersonItem;
  v9 = [(_TVRUIPersonItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factoidItem, a3);
    objc_storeStrong((id *)&v10->_mediaInfo, a4);
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;
  }
  return v10;
}

+ (id)itemWithFactoidItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFactoidItem:v4 mediaInfo:0];

  return v5;
}

+ (id)itemWithMediaInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFactoidItem:0 mediaInfo:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_TVRUIPersonItem isFactoid](self, "isFactoid"));
  id v7 = [(_TVRUIPersonItem *)self factoidItem];
  id v8 = [(_TVRUIPersonItem *)self mediaInfo];
  v9 = [v8 title];
  v10 = [v3 stringWithFormat:@"<%@ %p: isFactoid=%@ factoidItem=%@; name=%@>", v5, self, v6, v7, v9];;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(_TVRUIPersonItem *)self identifier];
    v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(_TVRUIPersonItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isFactoid
{
  v2 = [(_TVRUIPersonItem *)self factoidItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isMediaInfo
{
  v2 = [(_TVRUIPersonItem *)self mediaInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isExpandable
{
  v2 = [(_TVRUIPersonItem *)self factoidItem];
  unint64_t v3 = ((unint64_t)[v2 factoidOptions] >> 2) & 1;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_TVRUIPersonItem *)self factoidItem];
  v6 = [(_TVRUIPersonItem *)self mediaInfo];
  char v7 = (void *)[v4 initWithFactoidItem:v5 mediaInfo:v6];

  return v7;
}

- (_TVRUIFactoidItem)factoidItem
{
  return self->_factoidItem;
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_factoidItem, 0);
}

@end