@interface SFAirDropTransferChange
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSUUID)proxyIdentifier;
- (SFAirDropTransferChange)initWithBSXPCCoder:(id)a3;
- (SFAirDropTransferChange)initWithCoder:(id)a3;
- (SFAirDropTransferChange)initWithState:(int64_t)a3 progress:(double)a4 proxyIdentifier:(id)a5 displayName:(id)a6 status:(id)a7;
- (SFProxyText)displayName;
- (SFProxyText)status;
- (double)progress;
- (int64_t)state;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAirDropTransferChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyIdentifier"];
  [v4 decodeFloatForKey:@"progress"];
  double v7 = v6;
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"state"];

  v11 = [(SFAirDropTransferChange *)self initWithState:v10 progress:v5 proxyIdentifier:v8 displayName:v9 status:v7];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  proxyIdentifier = self->_proxyIdentifier;
  id v6 = a3;
  [v6 encodeObject:proxyIdentifier forKey:@"proxyIdentifier"];
  double progress = self->_progress;
  *(float *)&double progress = progress;
  [v6 encodeFloat:@"progress" forKey:progress];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_status forKey:@"status"];
  [v6 encodeInteger:self->_state forKey:@"state"];
}

- (SFAirDropTransferChange)initWithState:(int64_t)a3 progress:(double)a4 proxyIdentifier:(id)a5 displayName:(id)a6 status:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SFAirDropTransferChange;
  v16 = [(SFAirDropTransferChange *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_state = a3;
    v16->_double progress = a4;
    objc_storeStrong((id *)&v16->_proxyIdentifier, a5);
    objc_storeStrong((id *)&v17->_displayName, a6);
    objc_storeStrong((id *)&v17->_status, a7);
  }

  return v17;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SFAirDropTransferChange;
  uint64_t v4 = [(SFAirDropTransferChange *)&v10 description];
  v5 = (void *)v4;
  unint64_t state = self->_state;
  if (state > 7) {
    double v7 = &stru_1EF9BDC68;
  }
  else {
    double v7 = off_1E5BBE1E0[state];
  }
  v8 = [v3 stringWithFormat:@"<%@ state:%@ progress:%f proxyIdentifier:%@ displayName:%@ status:%@>", v4, v7, *(void *)&self->_progress, self->_proxyIdentifier, self->_displayName, self->_status];

  return (NSString *)v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SFAirDropTransferChange)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyIdentifier"];
  [v4 decodeDoubleForKey:@"progress"];
  double v7 = v6;
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  uint64_t v10 = [v4 decodeInt64ForKey:@"state"];

  v11 = [(SFAirDropTransferChange *)self initWithState:v10 progress:v5 proxyIdentifier:v8 displayName:v9 status:v7];
  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  proxyIdentifier = self->_proxyIdentifier;
  id v5 = a3;
  [v5 encodeObject:proxyIdentifier forKey:@"proxyIdentifier"];
  [v5 encodeDouble:@"progress" forKey:self->_progress];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_status forKey:@"status"];
  [v5 encodeInt64:self->_state forKey:@"state"];
}

- (int64_t)state
{
  return self->_state;
}

- (double)progress
{
  return self->_progress;
}

- (NSUUID)proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (SFProxyText)displayName
{
  return self->_displayName;
}

- (SFProxyText)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_proxyIdentifier, 0);
}

@end