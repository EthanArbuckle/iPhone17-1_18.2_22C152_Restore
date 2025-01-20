@interface TUICFQueryResult
- (BOOL)allowCallForDestinationID;
- (BOOL)isFromBlockList;
- (id)description;
- (void)setAllowCallForDestinationID:(BOOL)a3;
- (void)setFromBlockList:(BOOL)a3;
@end

@implementation TUICFQueryResult

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" fromBlockList=%d", -[TUICFQueryResult isFromBlockList](self, "isFromBlockList"));
  objc_msgSend(v3, "appendFormat:", @" allowCallForDestinationID=%d", -[TUICFQueryResult allowCallForDestinationID](self, "allowCallForDestinationID"));
  [v3 appendString:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)allowCallForDestinationID
{
  return self->_allowCallForDestinationID;
}

- (void)setAllowCallForDestinationID:(BOOL)a3
{
  self->_allowCallForDestinationID = a3;
}

- (BOOL)isFromBlockList
{
  return self->_fromBlockList;
}

- (void)setFromBlockList:(BOOL)a3
{
  self->_fromBlockList = a3;
}

@end