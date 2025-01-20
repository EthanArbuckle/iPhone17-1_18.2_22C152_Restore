@interface PIParallaxStyleRecipe
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParallaxStyleRecipe:(id)a3;
- (NSArray)backgroundFilters;
- (NSArray)foregroundFilters;
- (NSArray)matteFilters;
- (NSDictionary)parameters;
- (PIParallaxStyleRecipe)init;
- (PIParallaxStyleRecipe)initWithParameters:(id)a3 foregroundFilters:(id)a4 backgroundFilters:(id)a5 matteFilters:(id)a6;
- (id)description;
@end

@implementation PIParallaxStyleRecipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteFilters, 0);
  objc_storeStrong((id *)&self->_backgroundFilters, 0);
  objc_storeStrong((id *)&self->_foregroundFilters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (NSArray)matteFilters
{
  return self->_matteFilters;
}

- (NSArray)backgroundFilters
{
  return self->_backgroundFilters;
}

- (NSArray)foregroundFilters
{
  return self->_foregroundFilters;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIParallaxStyleRecipe *)self parameters];
  v6 = [(PIParallaxStyleRecipe *)self foregroundFilters];
  v7 = [(PIParallaxStyleRecipe *)self backgroundFilters];
  v8 = [(PIParallaxStyleRecipe *)self matteFilters];
  v9 = [v3 stringWithFormat:@"<%@:%p parameters: %@\nforeground:%@\n background: %@\n matte: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqualToParallaxStyleRecipe:(id)a3
{
  id v4 = a3;
  v5 = [(PIParallaxStyleRecipe *)self parameters];
  v6 = [v4 parameters];
  int v7 = [v5 isEqualToDictionary:v6];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [(PIParallaxStyleRecipe *)self foregroundFilters];
  v9 = [v4 foregroundFilters];
  int v10 = [v8 isEqualToArray:v9];

  if (!v10) {
    goto LABEL_5;
  }
  v11 = [(PIParallaxStyleRecipe *)self backgroundFilters];
  v12 = [v4 backgroundFilters];
  int v13 = [v11 isEqualToArray:v12];

  if (v13)
  {
    v14 = [(PIParallaxStyleRecipe *)self matteFilters];
    v15 = [v4 matteFilters];
    char v16 = [v14 isEqualToArray:v15];
  }
  else
  {
LABEL_5:
    char v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PIParallaxStyleRecipe *)self isEqualToParallaxStyleRecipe:v4];

  return v5;
}

- (PIParallaxStyleRecipe)initWithParameters:(id)a3 foregroundFilters:(id)a4 backgroundFilters:(id)a5 matteFilters:(id)a6
{
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxStyleRecipe;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = [(PIParallaxStyleRecipe *)&v23 init];
  uint64_t v14 = objc_msgSend(v12, "copy", v23.receiver, v23.super_class);

  parameters = v13->_parameters;
  v13->_parameters = (NSDictionary *)v14;

  uint64_t v16 = [v11 copy];
  foregroundFilters = v13->_foregroundFilters;
  v13->_foregroundFilters = (NSArray *)v16;

  uint64_t v18 = [v10 copy];
  backgroundFilters = v13->_backgroundFilters;
  v13->_backgroundFilters = (NSArray *)v18;

  uint64_t v20 = [v9 copy];
  matteFilters = v13->_matteFilters;
  v13->_matteFilters = (NSArray *)v20;

  return v13;
}

- (PIParallaxStyleRecipe)init
{
  return [(PIParallaxStyleRecipe *)self initWithParameters:MEMORY[0x1E4F1CC08] foregroundFilters:MEMORY[0x1E4F1CBF0] backgroundFilters:MEMORY[0x1E4F1CBF0] matteFilters:MEMORY[0x1E4F1CBF0]];
}

@end