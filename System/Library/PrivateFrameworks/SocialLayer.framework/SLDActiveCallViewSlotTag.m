@interface SLDActiveCallViewSlotTag
+ (BOOL)supportsSecureCoding;
+ (id)tagForMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6;
- (BOOL)isCallActive;
- (BOOL)isEqual:(id)a3;
- (NSData)activeCallGroupPhotoData;
- (NSNumber)callActiveNumber;
- (NSNumber)maxWidthNumber;
- (NSString)activeCallDisplayName;
- (SLDActiveCallViewSlotTag)initWithCoder:(id)a3;
- (SLDActiveCallViewSlotTag)initWithMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6;
- (double)maxWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCallDisplayName:(id)a3;
- (void)setActiveCallGroupPhotoData:(id)a3;
- (void)setCallActiveNumber:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMaxWidthNumber:(id)a3;
@end

@implementation SLDActiveCallViewSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tagForMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  v11 = [[SLDActiveCallViewSlotTag alloc] initWithMaxWidth:v7 callActive:v10 activeCallGroupPhotoData:v9 activeCallDisplayName:a3];

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
  BOOL v5 = [(SLDActiveCallViewSlotTag *)self isCallActive];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  BOOL v7 = [v3 stringWithFormat:@"<SLDActiveCallViewSlotTag: %p> maxWidth:[%@], callActive: [%@]", self, v4, v6];

  return v7;
}

- (SLDActiveCallViewSlotTag)initWithMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6
{
  BOOL v8 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SLDActiveCallViewSlotTag;
  v13 = [(SLDActiveCallViewSlotTag *)&v21 init];
  v15 = v13;
  if (v13)
  {
    v13->_maxWidth = a3;
    *(float *)&double v14 = a3;
    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithFloat:v14];
    maxWidthNumber = v15->_maxWidthNumber;
    v15->_maxWidthNumber = (NSNumber *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    callActiveNumber = v15->_callActiveNumber;
    v15->_callActiveNumber = (NSNumber *)v18;

    objc_storeStrong((id *)&v15->_activeCallGroupPhotoData, a5);
    objc_storeStrong((id *)&v15->_activeCallDisplayName, a6);
  }

  return v15;
}

- (BOOL)isCallActive
{
  v2 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  v15 = (void *)MEMORY[0x1E4FB3490];
  id v3 = a3;
  uint64_t v4 = [v3 accessibilityButtonShapes];
  uint64_t v5 = [v3 accessibilityContrast];
  uint64_t v6 = [v3 displayScale];
  uint64_t v7 = [v3 layoutDirection];
  BOOL v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68]);
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  v13 = [v15 slotStyleWithAccessibilityButtonShapes:v4 accessibilityContrast:v5 displayRange:1 displayScale:v6 layoutDirection:v7 legibilityWeight:0 localization:v8 preferredContentSizeCategory:v9 tintColor:ConstantColor userInterfaceIdiom:v11 userInterfaceStyle:v12];

  return v13;
}

- (SLDActiveCallViewSlotTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLDActiveCallViewSlotTag;
  uint64_t v5 = [(SLDActiveCallViewSlotTag *)&v16 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"maxWidth"];
    v5->_maxWidth = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidthNumber"];
    maxWidthNumber = v5->_maxWidthNumber;
    v5->_maxWidthNumber = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callActive"];
    callActiveNumber = v5->_callActiveNumber;
    v5->_callActiveNumber = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeCallGroupPhotoData"];
    activeCallGroupPhotoData = v5->_activeCallGroupPhotoData;
    v5->_activeCallGroupPhotoData = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeCallDisplayName"];
    activeCallDisplayName = v5->_activeCallDisplayName;
    v5->_activeCallDisplayName = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SLDActiveCallViewSlotTag *)self maxWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxWidth");
  uint64_t v5 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
  [v4 encodeObject:v5 forKey:@"maxWidthNumber"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SLDActiveCallViewSlotTag isCallActive](self, "isCallActive"), @"callActive");
  double v6 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
  [v4 encodeObject:v6 forKey:@"activeCallGroupPhotoData"];

  id v7 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
  [v4 encodeObject:v7 forKey:@"activeCallDisplayName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SLDActiveCallViewSlotTag *)self maxWidth];
  objc_msgSend(v4, "setMaxWidth:");
  uint64_t v5 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
  [v4 setMaxWidthNumber:v5];

  double v6 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
  [v4 setCallActiveNumber:v6];

  id v7 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
  [v4 setActiveCallGroupPhotoData:v7];

  BOOL v8 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
  [v4 setActiveCallDisplayName:v8];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = (SLDActiveCallViewSlotTag *)v5;
    id v7 = v6;
    if (v6 == self)
    {
      char v19 = 1;
LABEL_40:

      goto LABEL_41;
    }
    [(SLDActiveCallViewSlotTag *)v6 maxWidth];
    double v9 = v8;
    [(SLDActiveCallViewSlotTag *)self maxWidth];
    if (!SL_CGFloatApproximatelyEqualToFloat(v9, v10)) {
      goto LABEL_39;
    }
    uint64_t v11 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
    if (v11
      || ([(SLDActiveCallViewSlotTag *)v7 maxWidthNumber],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
      if (!v12) {
        goto LABEL_35;
      }
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [(SLDActiveCallViewSlotTag *)v7 maxWidthNumber];
      if (!v14) {
        goto LABEL_34;
      }
      v15 = (void *)v14;
      objc_super v16 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
      v17 = [(SLDActiveCallViewSlotTag *)v7 maxWidthNumber];
      int v18 = [v16 isEqualToNumber:v17];

      if (v11)
      {

        if (!v18) {
          goto LABEL_39;
        }
      }
      else
      {

        if ((v18 & 1) == 0) {
          goto LABEL_39;
        }
      }
    }
    uint64_t v11 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
    if (v11
      || ([(SLDActiveCallViewSlotTag *)v7 callActiveNumber],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v20 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
      if (!v20) {
        goto LABEL_35;
      }
      uint64_t v13 = (void *)v20;
      uint64_t v21 = [(SLDActiveCallViewSlotTag *)v7 callActiveNumber];
      if (!v21) {
        goto LABEL_34;
      }
      v22 = (void *)v21;
      v23 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
      v24 = [(SLDActiveCallViewSlotTag *)v7 callActiveNumber];
      int v25 = [v23 isEqualToNumber:v24];

      if (v11)
      {

        if (!v25) {
          goto LABEL_39;
        }
      }
      else
      {

        if ((v25 & 1) == 0) {
          goto LABEL_39;
        }
      }
    }
    uint64_t v11 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
    if (!v11)
    {
      id v3 = [(SLDActiveCallViewSlotTag *)v7 activeCallGroupPhotoData];
      if (!v3)
      {
LABEL_28:
        uint64_t v11 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
        if (!v11)
        {
          id v3 = [(SLDActiveCallViewSlotTag *)v7 activeCallDisplayName];
          if (!v3)
          {
            char v19 = 1;
LABEL_46:

            goto LABEL_37;
          }
        }
        uint64_t v32 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
        if (v32)
        {
          v33 = (void *)v32;
          uint64_t v34 = [(SLDActiveCallViewSlotTag *)v7 activeCallDisplayName];
          if (v34)
          {
            v35 = (void *)v34;
            v36 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
            v37 = [(SLDActiveCallViewSlotTag *)v7 activeCallDisplayName];
            char v19 = [v36 isEqualToString:v37];

            if (!v11) {
              goto LABEL_46;
            }
LABEL_37:

            goto LABEL_40;
          }
        }
        char v19 = 0;
        if (!v11) {
          goto LABEL_46;
        }
        goto LABEL_37;
      }
    }
    uint64_t v26 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
    if (!v26)
    {
LABEL_35:
      char v19 = 0;
      if (!v11) {
        uint64_t v11 = v3;
      }
      goto LABEL_37;
    }
    uint64_t v13 = (void *)v26;
    uint64_t v27 = [(SLDActiveCallViewSlotTag *)v7 activeCallGroupPhotoData];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
      v30 = [(SLDActiveCallViewSlotTag *)v7 activeCallGroupPhotoData];
      int v31 = [v29 isEqualToData:v30];

      if (v11)
      {

        if (v31) {
          goto LABEL_28;
        }
      }
      else
      {

        if (v31) {
          goto LABEL_28;
        }
      }
LABEL_39:
      char v19 = 0;
      goto LABEL_40;
    }
LABEL_34:

    goto LABEL_35;
  }
  char v19 = 0;
LABEL_41:

  return v19;
}

- (unint64_t)hash
{
  id v3 = [(SLDActiveCallViewSlotTag *)self maxWidthNumber];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLDActiveCallViewSlotTag *)self callActiveNumber];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(SLDActiveCallViewSlotTag *)self activeCallGroupPhotoData];
  uint64_t v8 = [v7 hash];
  double v9 = [(SLDActiveCallViewSlotTag *)self activeCallDisplayName];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (NSData)activeCallGroupPhotoData
{
  return self->_activeCallGroupPhotoData;
}

- (void)setActiveCallGroupPhotoData:(id)a3
{
}

- (NSString)activeCallDisplayName
{
  return self->_activeCallDisplayName;
}

- (void)setActiveCallDisplayName:(id)a3
{
}

- (NSNumber)maxWidthNumber
{
  return self->_maxWidthNumber;
}

- (void)setMaxWidthNumber:(id)a3
{
}

- (NSNumber)callActiveNumber
{
  return self->_callActiveNumber;
}

- (void)setCallActiveNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callActiveNumber, 0);
  objc_storeStrong((id *)&self->_maxWidthNumber, 0);
  objc_storeStrong((id *)&self->_activeCallDisplayName, 0);
  objc_storeStrong((id *)&self->_activeCallGroupPhotoData, 0);
}

@end