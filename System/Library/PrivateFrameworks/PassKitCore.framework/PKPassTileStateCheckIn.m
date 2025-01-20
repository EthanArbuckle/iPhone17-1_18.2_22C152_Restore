@interface PKPassTileStateCheckIn
+ (BOOL)supportsSecureCoding;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (PKDateContainer)availableFrom;
- (PKPassTileAccessory)secondaryAccessory;
- (PKPassTileStateCheckIn)initWithCoder:(id)a3;
- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableFrom:(id)a3;
- (void)setSecondaryAccessory:(id)a3;
@end

@implementation PKPassTileStateCheckIn

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateCheckIn;
  if ([(PKPassTileState *)&v17 _setUpWithDictionary:v4])
  {
    v5 = [v4 PKStringForKey:@"availableFrom"];
    double v16 = 0.0;
    uint64_t v6 = _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v5, 0, &v16);
    v7 = (void *)v6;
    if (!v5 || (BOOL v8 = 0, v6))
    {
      if (v6)
      {
        v9 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)v16];
        v10 = [[PKDateContainer alloc] initWithDate:v7 timeZone:v9];
        availableFrom = self->_availableFrom;
        self->_availableFrom = v10;
      }
      v12 = [v4 PKDictionaryForKey:@"secondaryAccessory"];
      BOOL v8 = 1;
      if (v12)
      {
        v13 = +[PKPassTileAccessory _createForDictionary:v12];
        secondaryAccessory = self->_secondaryAccessory;
        self->_secondaryAccessory = v13;

        if (!self->_secondaryAccessory) {
          BOOL v8 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileStateCheckIn;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PKPassTileState *)&v14 createResolvedStateWithBundle:v7 privateBundle:v6];
  id v9 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_secondaryAccessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6, v14.receiver, v14.super_class);

  v10 = (void *)v8[9];
  v8[9] = v9;

  uint64_t v11 = [(PKDateContainer *)self->_availableFrom copy];
  v12 = (void *)v8[8];
  v8[8] = v11;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateCheckIn)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileStateCheckIn;
  v5 = [(PKPassTileState *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableFrom"];
    availableFrom = v5->_availableFrom;
    v5->_availableFrom = (PKDateContainer *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryAccessory"];
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateCheckIn;
  id v4 = a3;
  [(PKPassTileState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_availableFrom, @"availableFrom", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_secondaryAccessory forKey:@"secondaryAccessory"];
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileStateCheckIn;
  if ([(PKPassTileState *)&v13 isEqualToUnresolvedState:v4])
  {
    objc_super v5 = v4;
    uint64_t v6 = (PKDateContainer *)v5[8];
    availableFrom = self->_availableFrom;
    if (v6) {
      BOOL v8 = availableFrom == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (v6 == availableFrom)
      {
LABEL_11:
        v10 = (PKPassTileAccessory *)v5[9];
        secondaryAccessory = self->_secondaryAccessory;
        if (v10 && secondaryAccessory) {
          BOOL v9 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v10, "isEqualToUnresolvedAccessory:");
        }
        else {
          BOOL v9 = v10 == secondaryAccessory;
        }
        goto LABEL_15;
      }
    }
    else if (-[PKDateContainer isEqual:](v6, "isEqual:"))
    {
      goto LABEL_11;
    }
    BOOL v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (PKDateContainer)availableFrom
{
  availableFrom = self->_availableFrom;
  if (availableFrom)
  {
    v3 = availableFrom;
  }
  else
  {
    id v4 = [(PKPassTileState *)self actions];
    if ([v4 count] == 1)
    {
      objc_super v5 = [v4 firstObject];
      uint64_t v6 = [v5 availableFrom];
      id v7 = (void *)MEMORY[0x1E4F1CAF0];
      [v5 availableFromOffsetFromUTC];
      BOOL v9 = [v7 timeZoneForSecondsFromGMT:(uint64_t)v8];
      v3 = [[PKDateContainer alloc] initWithDate:v6 timeZone:v9];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)setAvailableFrom:(id)a3
{
}

- (PKPassTileAccessory)secondaryAccessory
{
  return self->_secondaryAccessory;
}

- (void)setSecondaryAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_availableFrom, 0);
}

@end