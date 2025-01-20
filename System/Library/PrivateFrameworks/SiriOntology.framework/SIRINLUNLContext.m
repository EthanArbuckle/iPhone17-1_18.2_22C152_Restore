@interface SIRINLUNLContext
+ (BOOL)supportsSecureCoding;
- (NSArray)activeTasks;
- (NSArray)executedTasks;
- (NSArray)salientEntities;
- (NSArray)systemDialogActs;
- (SIRINLUNLContext)initWithCoder:(id)a3;
- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5;
- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5 salientEntities:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveTasks:(id)a3;
- (void)setExecutedTasks:(id)a3;
- (void)setSalientEntities:(id)a3;
- (void)setSystemDialogActs:(id)a3;
@end

@implementation SIRINLUNLContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
}

- (void)setSalientEntities:(id)a3
{
}

- (NSArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setExecutedTasks:(id)a3
{
}

- (NSArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setActiveTasks:(id)a3
{
}

- (NSArray)activeTasks
{
  return self->_activeTasks;
}

- (void)setSystemDialogActs:(id)a3
{
}

- (NSArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (id)description
{
  v3 = [(SIRINLUNLContext *)self systemDialogActs];
  v4 = +[SIRINLUPrintUtils indentArray:v3 numSpaces:4];

  v5 = [(SIRINLUNLContext *)self activeTasks];
  v6 = +[SIRINLUPrintUtils indentArray:v5 numSpaces:4];

  v7 = [(SIRINLUNLContext *)self executedTasks];
  v8 = +[SIRINLUPrintUtils indentArray:v7 numSpaces:4];

  v9 = [(SIRINLUNLContext *)self salientEntities];
  v10 = +[SIRINLUPrintUtils indentArray:v9 numSpaces:4];

  v11 = [NSString stringWithFormat:@"{NLContext\n  systemDialogActs:\n%@\n  activeTasks:\n%@\n  executedTasks:\n%@\n  salientEntities:\n%@\n}", v4, v6, v8, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUNLContext *)self systemDialogActs];
  [v4 encodeObject:v5 forKey:@"systemDialogActs"];

  v6 = [(SIRINLUNLContext *)self activeTasks];
  [v4 encodeObject:v6 forKey:@"activeTasks"];

  v7 = [(SIRINLUNLContext *)self executedTasks];
  [v4 encodeObject:v7 forKey:@"executedTasks"];

  id v8 = [(SIRINLUNLContext *)self salientEntities];
  [v4 encodeObject:v8 forKey:@"salientEntities"];
}

- (SIRINLUNLContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SIRINLUNLContext;
  v5 = [(SIRINLUNLContext *)&v33 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"systemDialogActs"];
    systemDialogActs = v5->_systemDialogActs;
    v5->_systemDialogActs = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"activeTasks"];
    activeTasks = v5->_activeTasks;
    v5->_activeTasks = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"executedTasks"];
    executedTasks = v5->_executedTasks;
    v5->_executedTasks = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"salientEntities"];
    salientEntities = v5->_salientEntities;
    v5->_salientEntities = (NSArray *)v30;
  }
  return v5;
}

- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUNLContext;
  uint64_t v12 = [(SIRINLUNLContext *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systemDialogActs, a3);
    objc_storeStrong((id *)&v13->_activeTasks, a4);
    objc_storeStrong((id *)&v13->_executedTasks, a5);
  }

  return v13;
}

- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5 salientEntities:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SIRINLUNLContext;
  objc_super v15 = [(SIRINLUNLContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemDialogActs, a3);
    objc_storeStrong((id *)&v16->_activeTasks, a4);
    objc_storeStrong((id *)&v16->_executedTasks, a5);
    objc_storeStrong((id *)&v16->_salientEntities, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end