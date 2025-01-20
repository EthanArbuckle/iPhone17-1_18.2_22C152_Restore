@interface BCEPubBookPosition
+ (id)positionWithCFI:(id)a3;
- (BCCFI)cfiPosition;
- (NSString)description;
- (int64_t)compare:(id)a3;
- (void)setCfiPosition:(id)a3;
@end

@implementation BCEPubBookPosition

+ (id)positionWithCFI:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BCEPubBookPosition);
  v5 = [v3 tailCFI];

  [(BCEPubBookPosition *)v4 setCfiPosition:v5];

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  v6 = [(BCEPubBookPosition *)self cfiPosition];
  v7 = [v5 cfiPosition];
  id v8 = [v6 compare:v7];

  return (int64_t)v8;
}

- (NSString)description
{
  v2 = [(BCEPubBookPosition *)self cfiPosition];
  id v3 = +[NSString stringWithFormat:@"BCEPubBookPosition(%@)", v2];

  return (NSString *)v3;
}

- (BCCFI)cfiPosition
{
  return self->_cfiPosition;
}

- (void)setCfiPosition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end