@interface STStatusBarDataCellularEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithType:(int64_t)a3 stringValue:(id)a4 crossfadeStringValue:(id)a5 badgeStringValue:(id)a6 wifiCalling:(BOOL)a7 callForwarding:(BOOL)a8 showsSOSWhenDisabled:(BOOL)a9 sosAvailable:(BOOL)a10 isBootstrapCellular:(BOOL)a11 status:(int64_t)a12 lowDataMode:(BOOL)a13 rawValue:(int64_t)a14 displayValue:(int64_t)a15 displayRawValue:(BOOL)a16;
- (BOOL)callForwardingEnabled;
- (BOOL)isBootstrapCellular;
- (BOOL)showsSOSWhenDisabled;
- (BOOL)sosAvailable;
- (BOOL)wifiCallingEnabled;
- (NSString)badgeString;
- (NSString)crossfadeString;
- (NSString)string;
- (STStatusBarDataCellularEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataCellularEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataCellularEntry

+ (id)entryWithType:(int64_t)a3 stringValue:(id)a4 crossfadeStringValue:(id)a5 badgeStringValue:(id)a6 wifiCalling:(BOOL)a7 callForwarding:(BOOL)a8 showsSOSWhenDisabled:(BOOL)a9 sosAvailable:(BOOL)a10 isBootstrapCellular:(BOOL)a11 status:(int64_t)a12 lowDataMode:(BOOL)a13 rawValue:(int64_t)a14 displayValue:(int64_t)a15 displayRawValue:(BOOL)a16
{
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  uint64_t v22 = [a1 entryWithStatus:a12 lowDataMode:a13 rawValue:a14 displayValue:a15 displayRawValue:a16];
  *(void *)(v22 + 56) = a3;
  uint64_t v23 = [v21 copy];

  v24 = *(void **)(v22 + 64);
  *(void *)(v22 + 64) = v23;

  uint64_t v25 = [v20 copy];
  v26 = *(void **)(v22 + 72);
  *(void *)(v22 + 72) = v25;

  uint64_t v27 = [v19 copy];
  v28 = *(void **)(v22 + 80);
  *(void *)(v22 + 80) = v27;

  *(unsigned char *)(v22 + 48) = a7;
  *(unsigned char *)(v22 + 49) = a8;
  *(unsigned char *)(v22 + 50) = a9;
  *(unsigned char *)(v22 + 51) = a10;
  *(unsigned char *)(v22 + 52) = a11;

  return (id)v22;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)STStatusBarDataCellularEntry;
  v5 = [(STStatusBarDataNetworkEntry *)&v53 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataCellularEntry *)self type];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke;
  v51[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v52 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v51];
  v10 = [(STStatusBarDataCellularEntry *)self string];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_2;
  v49[3] = &unk_1E6B630A8;
  id v11 = v8;
  id v50 = v11;
  id v12 = (id)[v5 appendString:v10 counterpart:v49];

  v13 = [(STStatusBarDataCellularEntry *)self crossfadeString];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_3;
  v47[3] = &unk_1E6B630A8;
  id v14 = v11;
  id v48 = v14;
  id v15 = (id)[v5 appendString:v13 counterpart:v47];

  v16 = [(STStatusBarDataCellularEntry *)self badgeString];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_4;
  v45[3] = &unk_1E6B630A8;
  id v17 = v14;
  id v46 = v17;
  id v18 = (id)[v5 appendString:v16 counterpart:v45];

  BOOL v19 = [(STStatusBarDataCellularEntry *)self wifiCallingEnabled];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_5;
  v43[3] = &unk_1E6B630D0;
  id v20 = v17;
  id v44 = v20;
  id v21 = (id)[v5 appendBool:v19 counterpart:v43];
  BOOL v22 = [(STStatusBarDataCellularEntry *)self callForwardingEnabled];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_6;
  v41[3] = &unk_1E6B630D0;
  id v23 = v20;
  id v42 = v23;
  id v24 = (id)[v5 appendBool:v22 counterpart:v41];
  BOOL v25 = [(STStatusBarDataCellularEntry *)self showsSOSWhenDisabled];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_7;
  v39[3] = &unk_1E6B630D0;
  id v26 = v23;
  id v40 = v26;
  id v27 = (id)[v5 appendBool:v25 counterpart:v39];
  BOOL v28 = [(STStatusBarDataCellularEntry *)self sosAvailable];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_8;
  v37[3] = &unk_1E6B630D0;
  id v29 = v26;
  id v38 = v29;
  id v30 = (id)[v5 appendBool:v28 counterpart:v37];
  BOOL v31 = [(STStatusBarDataCellularEntry *)self isBootstrapCellular];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_9;
  v35[3] = &unk_1E6B630D0;
  id v36 = v29;
  id v32 = v29;
  id v33 = (id)[v5 appendBool:v31 counterpart:v35];

  return v5;
}

- (BOOL)isBootstrapCellular
{
  return BYTE4(self->super._status);
}

- (int64_t)type
{
  return *(void *)&self->_wifiCallingEnabled;
}

- (BOOL)wifiCallingEnabled
{
  return self->super._status;
}

- (NSString)string
{
  return (NSString *)self->_type;
}

- (BOOL)sosAvailable
{
  return BYTE3(self->super._status);
}

- (BOOL)showsSOSWhenDisabled
{
  return BYTE2(self->super._status);
}

- (NSString)crossfadeString
{
  return self->_string;
}

- (BOOL)callForwardingEnabled
{
  return BYTE1(self->super._status);
}

- (NSString)badgeString
{
  return self->_crossfadeString;
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) isBootstrapCellular];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) sosAvailable];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) showsSOSWhenDisabled];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) callForwardingEnabled];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) wifiCallingEnabled];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) badgeString];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) crossfadeString];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) string];
}

uint64_t __57__STStatusBarDataCellularEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataCellularEntry;
  id v4 = a3;
  [(STStatusBarDataNetworkEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_wifiCallingEnabled, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_type forKey:@"string"];
  [v4 encodeObject:self->_string forKey:@"crossfadeString"];
  [v4 encodeObject:self->_crossfadeString forKey:@"badgeString"];
  [v4 encodeBool:LOBYTE(self->super._status) forKey:@"wifiCallingEnabled"];
  [v4 encodeBool:BYTE1(self->super._status) forKey:@"callForwardingEnabled"];
  [v4 encodeBool:BYTE2(self->super._status) forKey:@"showsSOSWhenDisabled"];
  [v4 encodeBool:BYTE3(self->super._status) forKey:@"sosAvailable"];
  [v4 encodeBool:BYTE4(self->super._status) forKey:@"isBootstrapCellular"];
}

- (STStatusBarDataCellularEntry)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataCellularEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataNetworkEntry *)&v13 initWithCoder:v3];
  *(void *)&v4->_wifiCallingEnabled = objc_msgSend(v3, "decodeIntegerForKey:", @"type", v13.receiver, v13.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  type = (void *)v4->_type;
  v4->_type = v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"crossfadeString"];
  string = v4->_string;
  v4->_string = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"badgeString"];
  crossfadeString = v4->_crossfadeString;
  v4->_crossfadeString = (NSString *)v9;

  LOBYTE(v4->super._status) = [v3 decodeBoolForKey:@"wifiCallingEnabled"];
  BYTE1(v4->super._status) = [v3 decodeBoolForKey:@"callForwardingEnabled"];
  BYTE2(v4->super._status) = [v3 decodeBoolForKey:@"showsSOSWhenDisabled"];
  BYTE3(v4->super._status) = [v3 decodeBoolForKey:@"sosAvailable"];
  char v11 = [v3 decodeBoolForKey:@"isBootstrapCellular"];

  BYTE4(v4->super._status) = v11;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v14.receiver = self;
  v14.super_class = (Class)STStatusBarDataCellularEntry;
  id v3 = [(STStatusBarDataNetworkEntry *)&v14 succinctDescriptionBuilder];
  id v4 = _STStatusBarDataCellularTypeDescription([(STStatusBarDataCellularEntry *)self type]);
  [v3 appendString:v4 withName:@"type"];

  uint64_t v5 = [(STStatusBarDataCellularEntry *)self string];
  [v3 appendString:v5 withName:@"string" skipIfEmpty:1];

  id v6 = [(STStatusBarDataCellularEntry *)self crossfadeString];
  [v3 appendString:v6 withName:@"crossfadeString" skipIfEmpty:1];

  uint64_t v7 = [(STStatusBarDataCellularEntry *)self badgeString];
  [v3 appendString:v7 withName:@"badgeString" skipIfEmpty:1];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry wifiCallingEnabled](self, "wifiCallingEnabled"), @"wifiCallingEnabled");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry callForwardingEnabled](self, "callForwardingEnabled"), @"callForwardingEnabled");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry showsSOSWhenDisabled](self, "showsSOSWhenDisabled"), @"showsSOSWhenDisabled");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry sosAvailable](self, "sosAvailable"), @"sosAvailable");
  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataCellularEntry isBootstrapCellular](self, "isBootstrapCellular"), @"isBootstrapCellular");

  return v3;
}

- (id)_hashBuilder
{
  v17.receiver = self;
  v17.super_class = (Class)STStatusBarDataCellularEntry;
  id v3 = [(STStatusBarDataNetworkEntry *)&v17 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataCellularEntry type](self, "type"));
  uint64_t v5 = [(STStatusBarDataCellularEntry *)self string];
  id v6 = (id)[v3 appendString:v5];

  uint64_t v7 = [(STStatusBarDataCellularEntry *)self crossfadeString];
  id v8 = (id)[v3 appendString:v7];

  id v9 = [(STStatusBarDataCellularEntry *)self badgeString];
  id v10 = (id)[v3 appendString:v9];

  id v11 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry wifiCallingEnabled](self, "wifiCallingEnabled"));
  id v12 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry callForwardingEnabled](self, "callForwardingEnabled"));
  id v13 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry showsSOSWhenDisabled](self, "showsSOSWhenDisabled"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry sosAvailable](self, "sosAvailable"));
  id v15 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataCellularEntry isBootstrapCellular](self, "isBootstrapCellular"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataCellularEntry;
  id v4 = a3;
  [(STStatusBarDataNetworkEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)&self->_wifiCallingEnabled, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_type forKey:@"string"];
  [v4 encodeObject:self->_string forKey:@"crossfadeString"];
  [v4 encodeObject:self->_crossfadeString forKey:@"badgeString"];
  [v4 encodeBool:LOBYTE(self->super._status) forKey:@"wifiCallingEnabled"];
  [v4 encodeBool:BYTE1(self->super._status) forKey:@"callForwardingEnabled"];
  [v4 encodeBool:BYTE2(self->super._status) forKey:@"showsSOSWhenDisabled"];
  [v4 encodeBool:BYTE3(self->super._status) forKey:@"sosAvailable"];
  [v4 encodeBool:BYTE4(self->super._status) forKey:@"isBootstrapCellular"];
}

- (STStatusBarDataCellularEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataCellularEntry;
  objc_super v5 = [(STStatusBarDataNetworkEntry *)&v13 initWithBSXPCCoder:v4];
  if (v5)
  {
    *(void *)&v5->_wifiCallingEnabled = [v4 decodeInt64ForKey:@"type"];
    uint64_t v6 = [v4 decodeStringForKey:@"string"];
    type = (void *)v5->_type;
    v5->_type = v6;

    uint64_t v8 = [v4 decodeStringForKey:@"crossfadeString"];
    string = v5->_string;
    v5->_string = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"badgeString"];
    crossfadeString = v5->_crossfadeString;
    v5->_crossfadeString = (NSString *)v10;

    LOBYTE(v5->super._status) = [v4 decodeBoolForKey:@"wifiCallingEnabled"];
    BYTE1(v5->super._status) = [v4 decodeBoolForKey:@"callForwardingEnabled"];
    BYTE2(v5->super._status) = [v4 decodeBoolForKey:@"showsSOSWhenDisabled"];
    BYTE3(v5->super._status) = [v4 decodeBoolForKey:@"sosAvailable"];
    BYTE4(v5->super._status) = [v4 decodeBoolForKey:@"isBootstrapCellular"];
  }

  return v5;
}

@end