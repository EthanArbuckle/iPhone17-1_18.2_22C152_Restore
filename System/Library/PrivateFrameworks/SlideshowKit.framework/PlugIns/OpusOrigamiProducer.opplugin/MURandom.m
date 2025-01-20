@interface MURandom
+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo;
+ (BOOL)clearVars;
+ (id)randomGeneratorWithSeed:(unint64_t)a3;
- (double)randomFloatInRange:(double)a3 :(double)a4;
- (void)_seed:(unint64_t)a3;
@end

@implementation MURandom

+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo
{
  return ($428C0FB8A9BF713540BE3970CA928F37 *)&unk_1F13B0;
}

+ (BOOL)clearVars
{
  return 0;
}

- (void)_seed:(unint64_t)a3
{
}

+ (id)randomGeneratorWithSeed:(unint64_t)a3
{
  v4 = objc_alloc_init(MURandom);
  [(MURandom *)v4 _seed:a3];
  return v4;
}

- (double)randomFloatInRange:(double)a3 :(double)a4
{
  return a3 + (double)[(MURandom *)self randomInt] * 4.65661287e-10 * (a4 - a3);
}

@end