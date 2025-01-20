@interface PTChoiceRow
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncodable;
- (BOOL)isEqual:(id)a3;
- (NSArray)possibleShortTitles;
- (NSArray)possibleTitles;
- (NSArray)possibleValues;
- (NSString)choiceIdentifier;
- (PTChoiceRow)initWithCoder:(id)a3;
- (PTChoiceRowDataSource)dataSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForValue:(id)a3;
- (id)possibleShortTitles:(id)a3;
- (id)possibleValues:(id)a3 titles:(id)a4;
- (id)shortTitleForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)titleForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)titleForSection:(int64_t)a3;
- (id)valueForRow:(int64_t)a3 inSection:(int64_t)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChoiceIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPossibleShortTitles:(id)a3;
- (void)setPossibleTitles:(id)a3;
- (void)setPossibleValues:(id)a3;
@end

@implementation PTChoiceRow

- (id)possibleValues:(id)a3 titles:(id)a4
{
  id v6 = a4;
  [(PTChoiceRow *)self setPossibleValues:a3];
  [(PTChoiceRow *)self setPossibleTitles:v6];

  return self;
}

- (id)possibleShortTitles:(id)a3
{
  return self;
}

- (int64_t)numberOfSections
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_dataSource);
    int64_t v6 = [v5 numberOfSectionsForChoiceRow:self];
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (id)titleForSection:(int64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_dataSource);
    v8 = [v7 choiceRow:self titleForSection:a3];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_dataSource);
    int64_t v8 = [v7 choiceRow:self numberOfRowsInSection:a3];
  }
  else
  {
    int64_t v8 = [(NSArray *)self->_possibleValues count];
  }

  return v8;
}

- (id)valueForRow:(int64_t)a3 inSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
    v10 = [v9 choiceRow:self valueForRow:a3 inSection:a4];
  }
  else
  {
    v10 = [(NSArray *)self->_possibleValues objectAtIndex:a3];
  }

  return v10;
}

- (id)titleForRow:(int64_t)a3 inSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
    v10 = [v9 choiceRow:self titleForRow:a3 inSection:a4];
  }
  else
  {
    v10 = [(NSArray *)self->_possibleTitles objectAtIndex:a3];
  }

  return v10;
}

- (id)shortTitleForRow:(int64_t)a3 inSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
    v10 = [v9 choiceRow:self shortTitleForRow:a3 inSection:a4];
  }
  else
  {
    v10 = [(NSArray *)self->_possibleShortTitles objectAtIndex:a3];
  }

  return v10;
}

- (id)indexPathForValue:(id)a3
{
  id v4 = a3;
  if ([(PTChoiceRow *)self numberOfSections] < 1)
  {
LABEL_8:
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    while ([(PTChoiceRow *)self numberOfRowsInSection:v5] < 1)
    {
LABEL_7:
      if (++v5 >= [(PTChoiceRow *)self numberOfSections]) {
        goto LABEL_8;
      }
    }
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(PTChoiceRow *)self valueForRow:v6 inSection:v5];
      if ([v4 isEqual:v7]) {
        break;
      }

      if (++v6 >= [(PTChoiceRow *)self numberOfRowsInSection:v5]) {
        goto LABEL_7;
      }
    }
    int64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "pt_indexPathForRow:inSection:", v6, v5);
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PTChoiceRow *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTChoiceRow;
    if ([(PTRow *)&v7 isEqual:v4] && BSEqualObjects() && BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __19__PTChoiceRow_hash__block_invoke;
  v10[3] = &unk_1E63BC570;
  v10[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v10, 0);
  id v5 = (id)[v3 appendObject:self->_possibleValues];
  id v6 = (id)[v3 appendObject:self->_possibleTitles];
  id v7 = (id)[v3 appendObject:self->_possibleShortTitles];
  unint64_t v8 = [v3 hash];

  return v8;
}

id __19__PTChoiceRow_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTChoiceRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTChoiceRow;
  id v4 = [(PTRow *)&v6 copyWithZone:a3];
  [v4 setPossibleValues:self->_possibleValues];
  [v4 setPossibleTitles:self->_possibleTitles];
  [v4 setPossibleShortTitles:self->_possibleShortTitles];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTChoiceRow;
  id v4 = a3;
  [(PTRow *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_possibleValues, @"values", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_possibleTitles forKey:@"titles"];
  [v4 encodeObject:self->_possibleShortTitles forKey:@"shortTitles"];
}

- (PTChoiceRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTChoiceRow;
  objc_super v5 = [(PTRow *)&v20 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = PTPlistableClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"values"];
    possibleValues = v5->_possibleValues;
    v5->_possibleValues = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v8 forKey:@"titles"];
    possibleTitles = v5->_possibleTitles;
    v5->_possibleTitles = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v8 forKey:@"shortTitles"];
    possibleShortTitles = v5->_possibleShortTitles;
    v5->_possibleShortTitles = (NSArray *)v14;

    v16 = v5->_possibleTitles;
    objc_opt_class();
    if ((PTValidateArray(v16) & 1) == 0)
    {
      v17 = (__CFString *)v5->_possibleTitles;
      if (!v17) {
        v17 = @"nil";
      }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"PTChoiceRow expected array of strings for 'possibleTitles', got %@", v17 format];
    }
    if (!v5->_possibleValues) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"PTChoiceRow expected array of plist types for 'possibleValues', got nil" format];
    }
    v18 = v5->_possibleShortTitles;
    if (v18)
    {
      objc_opt_class();
      if ((PTValidateArray(v18) & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"PTChoiceRow expected optional array of strings for 'possibleShortTitles', got %@", v5->_possibleShortTitles format];
      }
    }
  }
  return v5;
}

- (BOOL)isEncodable
{
  v5.receiver = self;
  v5.super_class = (Class)PTChoiceRow;
  unsigned int v3 = [(PTRow *)&v5 isEncodable];
  if (v3) {
    LOBYTE(v3) = PTObjectIsRecursivelyPlistable(self->_possibleValues);
  }
  return v3;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (void)setPossibleValues:(id)a3
{
}

- (NSArray)possibleTitles
{
  return self->_possibleTitles;
}

- (void)setPossibleTitles:(id)a3
{
}

- (NSArray)possibleShortTitles
{
  return self->_possibleShortTitles;
}

- (void)setPossibleShortTitles:(id)a3
{
}

- (PTChoiceRowDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PTChoiceRowDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)choiceIdentifier
{
  return self->_choiceIdentifier;
}

- (void)setChoiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choiceIdentifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_possibleShortTitles, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

@end