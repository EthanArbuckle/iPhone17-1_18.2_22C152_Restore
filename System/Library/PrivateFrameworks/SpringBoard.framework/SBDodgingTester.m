@interface SBDodgingTester
- (PTSingleTestRecipe)testRecipe;
- (SBDodgingTester)initWithDodgingResolverController:(id)a3;
- (void)setTestRecipe:(id)a3;
@end

@implementation SBDodgingTester

- (SBDodgingTester)initWithDodgingResolverController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDodgingTester;
  v5 = [(SBDodgingTester *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F941D0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__SBDodgingTester_initWithDodgingResolverController___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    id v11 = v4;
    uint64_t v7 = [v6 recipeWithTitle:@"Add Dodging Item" action:v10];
    testRecipe = v5->_testRecipe;
    v5->_testRecipe = (PTSingleTestRecipe *)v7;

    +[PTDomain registerTestRecipe:v5->_testRecipe];
  }

  return v5;
}

void __53__SBDodgingTester_initWithDodgingResolverController___block_invoke(uint64_t a1)
{
  v23[10] = *MEMORY[0x1E4F143B8];
  v21 = [MEMORY[0x1E4F428B8] greenColor];
  v23[0] = v21;
  v1 = [MEMORY[0x1E4F428B8] orangeColor];
  v23[1] = v1;
  v2 = [MEMORY[0x1E4F428B8] purpleColor];
  v23[2] = v2;
  v3 = [MEMORY[0x1E4F428B8] blueColor];
  v23[3] = v3;
  id v4 = [MEMORY[0x1E4F428B8] yellowColor];
  v23[4] = v4;
  v5 = [MEMORY[0x1E4F428B8] systemPinkColor];
  v23[5] = v5;
  v6 = [MEMORY[0x1E4F428B8] brownColor];
  v23[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F428B8] magentaColor];
  v23[7] = v7;
  v8 = [MEMORY[0x1E4F428B8] cyanColor];
  v23[8] = v8;
  v9 = [MEMORY[0x1E4F428B8] systemDarkGreenColor];
  v23[9] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:10];

  unint64_t v11 = arc4random();
  unint64_t v12 = v11 % [v10 count];
  v13 = NSString;
  v14 = [&unk_1F33489C0 objectAtIndexedSubscript:v12];
  v15 = [MEMORY[0x1E4F29128] UUID];
  v16 = [v15 UUIDString];
  v17 = objc_msgSend(v16, "substringWithRange:", 0, 3);
  v18 = [v13 stringWithFormat:@"%@-%@", v14, v17];

  v19 = [SBDodgingTesterView alloc];
  v20 = [v10 objectAtIndexedSubscript:v12];
}

- (PTSingleTestRecipe)testRecipe
{
  return self->_testRecipe;
}

- (void)setTestRecipe:(id)a3
{
}

- (void).cxx_destruct
{
}

@end