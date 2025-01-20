@interface NSPredicate(CompoundConveniences)
- (id)rc_and:()CompoundConveniences;
- (id)rc_andNot:()CompoundConveniences;
- (id)rc_or:()CompoundConveniences;
@end

@implementation NSPredicate(CompoundConveniences)

- (id)rc_and:()CompoundConveniences
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v9[0] = a1;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v9 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)rc_or:()CompoundConveniences
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v9[0] = a1;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v9 count:2];
  v7 = [v3 orPredicateWithSubpredicates:v6];

  return v7;
}

- (id)rc_andNot:()CompoundConveniences
{
  v2 = objc_msgSend(MEMORY[0x1E4F28BA0], "notPredicateWithSubpredicate:");
  v3 = objc_msgSend(a1, "rc_and:", v2);

  return v3;
}

@end