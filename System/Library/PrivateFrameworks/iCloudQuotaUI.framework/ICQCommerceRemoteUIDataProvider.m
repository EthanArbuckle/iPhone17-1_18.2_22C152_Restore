@interface ICQCommerceRemoteUIDataProvider
- (BOOL)isPlist;
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (ICQCommerceRemoteUIDelegate)parent;
- (void)_setFailureType:(id)a3;
- (void)setParent:(id)a3;
- (void)setPlist:(BOOL)a3;
@end

@implementation ICQCommerceRemoteUIDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  self->_plist = 0;
  uint64_t v13 = 0;
  v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:&v13 error:0];
  v8 = v7;
  if (v7)
  {
    self->_plist = 1;
    v9 = [v7 objectForKeyedSubscript:@"failureType"];
    [(ICQCommerceRemoteUIDataProvider *)self _setFailureType:v9];

    v12.receiver = self;
    v12.super_class = (Class)ICQCommerceRemoteUIDataProvider;
    BOOL v10 = [(ISProtocolDataProvider *)&v12 parseData:v6 returningError:a4];
  }
  else
  {
    [(ISDataProvider *)self setOutput:v6];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_setFailureType:(id)a3
{
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v8 integerValue];
    v5 = [(ICQCommerceRemoteUIDataProvider *)self parent];
    id v6 = v5;
    uint64_t v7 = v4;
  }
  else
  {
    v5 = [(ICQCommerceRemoteUIDataProvider *)self parent];
    id v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setFailureType:v7];
}

- (BOOL)isPlist
{
  return self->_plist;
}

- (void)setPlist:(BOOL)a3
{
  self->_plist = a3;
}

- (ICQCommerceRemoteUIDelegate)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (ICQCommerceRemoteUIDelegate *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end