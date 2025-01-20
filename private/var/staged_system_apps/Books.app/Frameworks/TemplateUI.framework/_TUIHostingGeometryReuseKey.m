@interface _TUIHostingGeometryReuseKey
- (BOOL)isEqual:(id)a3;
- (CGSize)requestedSize;
- (NSString)identifier;
- (NSString)type;
- (_TUIHostingGeometryReuseKey)initWithType:(id)a3 identifier:(id)a4 requestedSize:(CGSize)a5;
- (unint64_t)hash;
@end

@implementation _TUIHostingGeometryReuseKey

- (_TUIHostingGeometryReuseKey)initWithType:(id)a3 identifier:(id)a4 requestedSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_TUIHostingGeometryReuseKey;
  v11 = [(_TUIHostingGeometryReuseKey *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v9 copy];
    type = v11->_type;
    v11->_type = v12;

    v14 = (NSString *)[v10 copy];
    identifier = v11->_identifier;
    v11->_identifier = v14;

    v11->_requestedSize.CGFloat width = width;
    v11->_requestedSize.CGFloat height = height;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NSString *)self->_identifier hash] ^ v3 ^ (unint64_t)fmax(self->_requestedSize.width, 0.0) ^ (unint64_t)fmax(self->_requestedSize.height, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7
    && (self->_requestedSize.width == *((double *)v7 + 3)
      ? (BOOL v9 = self->_requestedSize.height == *((double *)v7 + 4))
      : (BOOL v9 = 0),
        v9
     && ((type = self->_type, type == (NSString *)v8[1]) || -[NSString isEqualToString:](type, "isEqualToString:"))))
  {
    identifier = self->_identifier;
    if (identifier == (NSString *)v8[2]) {
      unsigned __int8 v12 = 1;
    }
    else {
      unsigned __int8 v12 = -[NSString isEqualToString:](identifier, "isEqualToString:");
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)requestedSize
{
  double width = self->_requestedSize.width;
  double height = self->_requestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end