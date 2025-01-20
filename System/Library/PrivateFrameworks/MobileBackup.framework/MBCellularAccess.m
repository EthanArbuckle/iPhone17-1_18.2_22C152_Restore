@interface MBCellularAccess
+ (BOOL)supportsSecureCoding;
+ (id)expensiveCellularAccess;
+ (id)inexpensiveCellularAccess;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)isEqual:(id)a3;
- (MBCellularAccess)init;
- (MBCellularAccess)initWithCoder:(id)a3;
- (MBCellularAccess)initWithDictionaryRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
@end

@implementation MBCellularAccess

+ (id)expensiveCellularAccess
{
  v2 = objc_opt_new();
  [v2 setAllowsExpensiveNetworkAccess:1];
  return v2;
}

+ (id)inexpensiveCellularAccess
{
  v2 = objc_opt_new();
  [v2 setAllowsExpensiveNetworkAccess:0];
  return v2;
}

- (MBCellularAccess)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBCellularAccess;
  result = [(MBCellularAccess *)&v3 init];
  if (result) {
    *(_WORD *)&result->_allowsExpensiveNetworkAccess = 256;
  }
  return result;
}

- (MBCellularAccess)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBCellularAccess;
  v5 = [(MBCellularAccess *)&v11 init];
  if (!v5) {
    goto LABEL_9;
  }
  v6 = [v4 objectForKeyedSubscript:@"allowsExpensiveNetworkAccess"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    v9 = 0;
    goto LABEL_12;
  }
  v5->_allowsExpensiveNetworkAccess = [v6 BOOLValue];
  v7 = [v4 objectForKeyedSubscript:@"allowsConstrainedNetworkAccess"];

  if (!v7)
  {
    char v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = v7;
    goto LABEL_11;
  }
  char v8 = [v7 BOOLValue];
LABEL_8:
  v5->_allowsConstrainedNetworkAccess = v8;

LABEL_9:
  v9 = v5;
LABEL_12:

  return v9;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"allowsExpensiveNetworkAccess";
  objc_super v3 = objc_msgSend(NSNumber, "numberWithBool:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  v7[1] = @"allowsConstrainedNetworkAccess";
  v8[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(MBCellularAccess *)self allowsExpensiveNetworkAccess],
        v5 == [v4 allowsExpensiveNetworkAccess]))
  {
    BOOL v7 = [(MBCellularAccess *)self allowsConstrainedNetworkAccess];
    int v6 = v7 ^ [v4 allowsConstrainedNetworkAccess] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (MBCellularAccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MBCellularAccess;
  int v5 = [(MBCellularAccess *)&v7 init];
  if (v5)
  {
    -[MBCellularAccess setAllowsExpensiveNetworkAccess:](v5, "setAllowsExpensiveNetworkAccess:", [v4 decodeBoolForKey:@"allowsExpensiveNetworkAccess"]);
    -[MBCellularAccess setAllowsConstrainedNetworkAccess:](v5, "setAllowsConstrainedNetworkAccess:", [v4 decodeBoolForKey:@"allowsConstrainedNetworkAccess"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"), @"allowsExpensiveNetworkAccess");
  objc_msgSend(v4, "encodeBool:forKey:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"), @"allowsConstrainedNetworkAccess");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "setAllowsConstrainedNetworkAccess:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; allowsExpensiveNetworkAccess=%d, allowsConstrainedNetworkAccess=%d>",
               class_getName(v4),
               self,
               [(MBCellularAccess *)self allowsExpensiveNetworkAccess],
               [(MBCellularAccess *)self allowsConstrainedNetworkAccess]);
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3
{
  self->_allowsConstrainedNetworkAccess = a3;
}

@end