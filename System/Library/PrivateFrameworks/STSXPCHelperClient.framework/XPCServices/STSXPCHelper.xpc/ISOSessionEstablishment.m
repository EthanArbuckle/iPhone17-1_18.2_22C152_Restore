@interface ISOSessionEstablishment
- (id)description;
@end

@implementation ISOSessionEstablishment

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = sub_10000C008(self->_readerKey);
  id v5 = [v3 initWithFormat:@"SessionEstablishment={\neReaderKey: %@\ndata: %@\n}", v4, self->_encData];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encData, 0);

  objc_storeStrong((id *)&self->_readerKey, 0);
}

@end