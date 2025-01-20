@interface WFEKCalendarDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)allCalendars;
- (BOOL)isEqual:(id)a3;
- (NSNumber)calendarRGBAValue;
- (NSString)calendarIdentifier;
- (NSString)calendarTitle;
- (WFEKCalendarDescriptor)initWithAllCalendars;
- (WFEKCalendarDescriptor)initWithCalendarTitle:(id)a3 identifier:(id)a4 RGBAValue:(id)a5;
- (WFEKCalendarDescriptor)initWithCoder:(id)a3;
- (id)matchingCalendarsFromArray:(id)a3;
- (id)matchingRemindersListsFromArray:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFEKCalendarDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarRGBAValue, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarTitle, 0);
}

- (NSNumber)calendarRGBAValue
{
  return self->_calendarRGBAValue;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (NSString)calendarTitle
{
  return self->_calendarTitle;
}

- (BOOL)allCalendars
{
  return self->_allCalendars;
}

- (id)matchingCalendarsFromArray:(id)a3
{
  id v4 = a3;
  if ([(WFEKCalendarDescriptor *)self allCalendars])
  {
    id v5 = v4;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke;
    v11[3] = &unk_1E65550B0;
    v11[4] = self;
    objc_msgSend(v4, "if_objectsPassingTest:", v11);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (![v5 count])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_2;
      v10[3] = &unk_1E65550B0;
      v10[4] = self;
      uint64_t v6 = objc_msgSend(v4, "if_objectsPassingTest:", v10);

      id v5 = (id)v6;
    }
    if (![v5 count])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_3;
      v9[3] = &unk_1E65550B0;
      v9[4] = self;
      uint64_t v7 = objc_msgSend(v4, "if_objectsPassingTest:", v9);

      id v5 = (id)v7;
    }
  }

  return v5;
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) calendarIdentifier];
  if (v4)
  {
    id v5 = [v3 calendarIdentifier];
    uint64_t v6 = [*(id *)(a1 + 32) calendarIdentifier];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 title];
  id v5 = [*(id *)(a1 + 32) calendarTitle];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) calendarRGBAValue];

    if (v7)
    {
      v8 = NSNumber;
      v9 = objc_msgSend(MEMORY[0x1E4FB45E0], "colorWithCGColor:", objc_msgSend(v3, "CGColor"));
      v10 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "RGBAValue"));

      v11 = [*(id *)(a1 + 32) calendarRGBAValue];
      uint64_t v12 = [v10 isEqualToNumber:v11];
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 title];
  id v4 = [*(id *)(a1 + 32) calendarTitle];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)matchingRemindersListsFromArray:(id)a3
{
  id v4 = a3;
  if ([(WFEKCalendarDescriptor *)self allCalendars])
  {
    id v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke;
    v9[3] = &unk_1E6555088;
    v9[4] = self;
    objc_msgSend(v4, "if_objectsPassingTest:", v9);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (![v5 count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke_2;
      v8[3] = &unk_1E6555088;
      v8[4] = self;
      uint64_t v6 = objc_msgSend(v4, "if_objectsPassingTest:", v8);

      id v5 = (id)v6;
    }
  }

  return v5;
}

uint64_t __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) calendarIdentifier];
  if (v4)
  {
    id v5 = [v3 objectID];
    uint64_t v6 = [v5 stringRepresentation];
    uint64_t v7 = [*(id *)(a1 + 32) calendarIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) calendarTitle];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (unint64_t)hash
{
  if ([(WFEKCalendarDescriptor *)self allCalendars]) {
    uint64_t v3 = 3405691582;
  }
  else {
    uint64_t v3 = 3133065982;
  }
  id v4 = [(WFEKCalendarDescriptor *)self calendarTitle];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(WFEKCalendarDescriptor *)self calendarIdentifier];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  uint64_t v8 = [(WFEKCalendarDescriptor *)self calendarRGBAValue];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFEKCalendarDescriptor *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(WFEKCalendarDescriptor *)v5 allCalendars]
        && [(WFEKCalendarDescriptor *)self allCalendars])
      {
        char v6 = 1;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v7 = [(WFEKCalendarDescriptor *)v5 calendarIdentifier];
      uint64_t v8 = [(WFEKCalendarDescriptor *)self calendarIdentifier];
      id v9 = v7;
      id v10 = v8;
      if (v9 == v10)
      {
      }
      else
      {
        v11 = v10;
        char v6 = 0;
        if (!v9 || !v10) {
          goto LABEL_25;
        }
        char v12 = [v9 isEqualToString:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_18;
        }
      }
      v13 = [(WFEKCalendarDescriptor *)v5 calendarTitle];
      v14 = [(WFEKCalendarDescriptor *)self calendarTitle];
      id v9 = v13;
      id v15 = v14;
      if (v9 == v15)
      {

LABEL_20:
        v17 = [(WFEKCalendarDescriptor *)v5 calendarRGBAValue];
        v18 = [(WFEKCalendarDescriptor *)self calendarRGBAValue];
        id v9 = v17;
        id v19 = v18;
        if (v9 == v19)
        {
          char v6 = 1;
          v11 = v9;
        }
        else
        {
          v11 = v19;
          char v6 = 0;
          if (v9 && v19) {
            char v6 = [v9 isEqual:v19];
          }
        }
        goto LABEL_25;
      }
      v11 = v15;
      char v6 = 0;
      if (v9 && v15)
      {
        char v16 = [v9 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
LABEL_18:
          char v6 = 0;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
LABEL_25:

      goto LABEL_26;
    }
    char v6 = 0;
  }
LABEL_27:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFEKCalendarDescriptor *)self calendarTitle];
  [v4 encodeObject:v5 forKey:@"calendarTitle"];

  char v6 = [(WFEKCalendarDescriptor *)self calendarIdentifier];
  [v4 encodeObject:v6 forKey:@"calendarIdentifier"];

  uint64_t v7 = [(WFEKCalendarDescriptor *)self calendarRGBAValue];
  [v4 encodeObject:v7 forKey:@"calendarRGBAValue"];

  objc_msgSend(NSNumber, "numberWithBool:", -[WFEKCalendarDescriptor allCalendars](self, "allCalendars"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"allCalendars"];
}

- (WFEKCalendarDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarTitle"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarIdentifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarRGBAValue"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allCalendars"];

  if ([v8 BOOLValue]) {
    id v9 = [(WFEKCalendarDescriptor *)self initWithAllCalendars];
  }
  else {
    id v9 = [(WFEKCalendarDescriptor *)self initWithCalendarTitle:v5 identifier:v6 RGBAValue:v7];
  }
  id v10 = v9;

  return v10;
}

- (WFEKCalendarDescriptor)initWithCalendarTitle:(id)a3 identifier:(id)a4 RGBAValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFEKCalendarDescriptor;
  v11 = [(WFEKCalendarDescriptor *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    calendarTitle = v11->_calendarTitle;
    v11->_calendarTitle = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    calendarIdentifier = v11->_calendarIdentifier;
    v11->_calendarIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_calendarRGBAValue, a5);
    char v16 = v11;
  }

  return v11;
}

- (WFEKCalendarDescriptor)initWithAllCalendars
{
  v6.receiver = self;
  v6.super_class = (Class)WFEKCalendarDescriptor;
  v2 = [(WFEKCalendarDescriptor *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_allCalendars = 1;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end