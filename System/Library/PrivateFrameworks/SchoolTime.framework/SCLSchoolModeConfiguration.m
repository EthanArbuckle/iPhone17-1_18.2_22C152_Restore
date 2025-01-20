@interface SCLSchoolModeConfiguration
- (BOOL)loadsSynchronously;
- (NSString)identifier;
- (NSUUID)pairingID;
- (NSXPCListenerEndpoint)testingEndpoint;
- (OS_dispatch_queue)targetQueue;
- (SCLSchoolModeConfiguration)init;
- (SCLSchoolModeDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLoadsSynchronously:(BOOL)a3;
- (void)setPairingID:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTestingEndpoint:(id)a3;
@end

@implementation SCLSchoolModeConfiguration

- (SCLSchoolModeConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLSchoolModeConfiguration;
  v2 = [(SCLSchoolModeConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SCLAutoUpdatingPairingID();
    pairingID = v2->_pairingID;
    v2->_pairingID = (NSUUID *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SCLSchoolModeConfiguration);
  v5 = [(SCLSchoolModeConfiguration *)self identifier];
  [(SCLSchoolModeConfiguration *)v4 setIdentifier:v5];

  objc_super v6 = [(SCLSchoolModeConfiguration *)self targetQueue];
  [(SCLSchoolModeConfiguration *)v4 setTargetQueue:v6];

  v7 = [(SCLSchoolModeConfiguration *)self delegate];
  [(SCLSchoolModeConfiguration *)v4 setDelegate:v7];

  v8 = [(SCLSchoolModeConfiguration *)self pairingID];
  [(SCLSchoolModeConfiguration *)v4 setPairingID:v8];

  [(SCLSchoolModeConfiguration *)v4 setLoadsSynchronously:[(SCLSchoolModeConfiguration *)self loadsSynchronously]];
  v9 = [(SCLSchoolModeConfiguration *)self testingEndpoint];
  [(SCLSchoolModeConfiguration *)v4 setTestingEndpoint:v9];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

- (SCLSchoolModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSchoolModeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (BOOL)loadsSynchronously
{
  return self->_loadsSynchronously;
}

- (void)setLoadsSynchronously:(BOOL)a3
{
  self->_loadsSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_testingEndpoint, 0);
}

- (void)setTestingEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)testingEndpoint
{
  return self->_testingEndpoint;
}

@end