@interface CLAuthSerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
@end

@implementation CLAuthSerializer

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(CLAuthSerializer *)self dataFromChange:a3];
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return [(CLAuthSerializer *)self changeFromData:a3 ofType:a5];
}

- (id)dataFromChange:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a3 data];
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  v4 = [[CLCompanionSyncAuthObject alloc] initWithData:a3];

  return v4;
}

@end