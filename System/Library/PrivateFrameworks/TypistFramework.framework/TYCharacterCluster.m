@interface TYCharacterCluster
- (BOOL)isCursive;
- (NSString)characterCluster;
- (TYCharacterCluster)initWithCharacters:(id)a3 isCursive:(BOOL)a4;
- (void)setCharacterCluster:(id)a3;
- (void)setIsCursive:(BOOL)a3;
@end

@implementation TYCharacterCluster

- (TYCharacterCluster)initWithCharacters:(id)a3 isCursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TYCharacterCluster;
  v7 = [(TYCharacterCluster *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(TYCharacterCluster *)v7 setCharacterCluster:v6];
    [(TYCharacterCluster *)v8 setIsCursive:v4];
  }

  return v8;
}

- (NSString)characterCluster
{
  return self->_characterCluster;
}

- (void)setCharacterCluster:(id)a3
{
}

- (BOOL)isCursive
{
  return self->_isCursive;
}

- (void)setIsCursive:(BOOL)a3
{
  self->_isCursive = a3;
}

- (void).cxx_destruct
{
}

@end