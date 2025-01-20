@interface NPKExpressState
- (NPKExpressState)initWithExpressPassConfiguration:(id)a3;
- (NPKExpressState)initWithNFCState:(unint64_t)a3 uwbState:(unint64_t)a4;
- (id)description;
- (unint64_t)nfcExpressState;
- (unint64_t)switchStateForMode:(unint64_t)a3;
- (unint64_t)uwbExpressState;
@end

@implementation NPKExpressState

- (NPKExpressState)initWithNFCState:(unint64_t)a3 uwbState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NPKExpressState;
  result = [(NPKExpressState *)&v7 init];
  if (result)
  {
    result->_nfcExpressState = a3;
    result->_uwbExpressState = a4;
  }
  return result;
}

- (NPKExpressState)initWithExpressPassConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 isNFCExpressEnabled]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  int v6 = [v4 isUWBExpressEnabled];

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  return [(NPKExpressState *)self initWithNFCState:v5 uwbState:v7];
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"( ");
  unint64_t v4 = [(NPKExpressState *)self nfcExpressState];
  if (v4 <= 2) {
    [v3 appendString:off_2644D6168[v4]];
  }
  [v3 appendString:@" : "];
  unint64_t v5 = [(NPKExpressState *)self uwbExpressState];
  if (v5 <= 2) {
    [v3 appendString:off_2644D6180[v5]];
  }
  [v3 appendString:@""]);
  return v3;
}

- (unint64_t)switchStateForMode:(unint64_t)a3
{
  if (a3 == 1) {
    unint64_t result = [(NPKExpressState *)self nfcExpressState];
  }
  else {
    unint64_t result = [(NPKExpressState *)self uwbExpressState];
  }
  if (result != 2) {
    return result != 1;
  }
  return result;
}

- (unint64_t)nfcExpressState
{
  return self->_nfcExpressState;
}

- (unint64_t)uwbExpressState
{
  return self->_uwbExpressState;
}

@end