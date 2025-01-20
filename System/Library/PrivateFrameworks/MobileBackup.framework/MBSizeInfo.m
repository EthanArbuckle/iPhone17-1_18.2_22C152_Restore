@interface MBSizeInfo
+ (BOOL)supportsSecureCoding;
- (MBSizeInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)size;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation MBSizeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBSizeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBSizeInfo;
  v5 = [(MBSizeInfo *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    -[MBSizeInfo setSize:](v5, "setSize:", [v6 unsignedLongLongValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    -[MBSizeInfo setState:](v5, "setState:", [v7 unsignedLongLongValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", -[MBSizeInfo size](self, "size"));
  [v5 encodeObject:v6 forKey:@"size"];

  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MBSizeInfo state](self, "state"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"state"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MBSizeInfo);
  [(MBSizeInfo *)v4 setSize:[(MBSizeInfo *)self size]];
  [(MBSizeInfo *)v4 setState:[(MBSizeInfo *)self state]];
  return v4;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end