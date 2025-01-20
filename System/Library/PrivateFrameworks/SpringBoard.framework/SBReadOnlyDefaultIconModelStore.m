@interface SBReadOnlyDefaultIconModelStore
- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (id)loadCurrentIconState:(id *)a3;
- (id)loadDesiredIconState:(id *)a3;
@end

@implementation SBReadOnlyDefaultIconModelStore

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)loadCurrentIconState:(id *)a3
{
  v4 = +[SBDefaultIconModelStore sharedInstance];
  v5 = [v4 loadCurrentIconState:a3];

  return v5;
}

- (id)loadDesiredIconState:(id *)a3
{
  v4 = +[SBDefaultIconModelStore sharedInstance];
  v5 = [v4 loadDesiredIconState:a3];

  return v5;
}

@end