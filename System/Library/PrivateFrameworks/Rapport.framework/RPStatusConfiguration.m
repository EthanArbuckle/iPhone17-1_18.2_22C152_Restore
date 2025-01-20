@interface RPStatusConfiguration
- (NSString)statusID;
- (RPStatusConfiguration)initWithStatusID:(id)a3 leeway:(double)a4 configurationFlags:(unint64_t)a5 statusUpdateHandler:(id)a6;
- (double)leeway;
- (id)handler;
- (unint64_t)flags;
@end

@implementation RPStatusConfiguration

- (RPStatusConfiguration)initWithStatusID:(id)a3 leeway:(double)a4 configurationFlags:(unint64_t)a5 statusUpdateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RPStatusConfiguration;
  v13 = [(RPStatusConfiguration *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_statusID, a3);
    v14->_leeway = a4;
    v14->_flags = a5;
    uint64_t v15 = MEMORY[0x1B3EBCC80](v12);
    id handler = v14->_handler;
    v14->_id handler = (id)v15;

    v17 = v14;
  }

  return v14;
}

- (NSString)statusID
{
  return self->_statusID;
}

- (double)leeway
{
  return self->_leeway;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_statusID, 0);
}

@end