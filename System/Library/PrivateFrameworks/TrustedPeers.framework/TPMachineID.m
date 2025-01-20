@interface TPMachineID
- (NSDate)modified;
- (NSString)machineID;
- (TPMachineID)initWithMachineID:(id)a3 status:(unint64_t)a4 modified:(id)a5;
- (id)description;
- (unint64_t)status;
@end

@implementation TPMachineID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

- (NSDate)modified
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(TPMachineID *)self machineID];
  unint64_t v5 = [(TPMachineID *)self status];
  if (v5 > 5) {
    v6 = @"allowed";
  }
  else {
    v6 = off_2640EC948[v5];
  }
  v7 = [(TPMachineID *)self modified];
  v8 = [v3 stringWithFormat:@"<TPMachineID: %@ %@ %@>", v4, v6, v7];

  return v8;
}

- (TPMachineID)initWithMachineID:(id)a3 status:(unint64_t)a4 modified:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TPMachineID;
  v11 = [(TPMachineID *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_machineID, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_modified, a5);
  }

  return v12;
}

@end