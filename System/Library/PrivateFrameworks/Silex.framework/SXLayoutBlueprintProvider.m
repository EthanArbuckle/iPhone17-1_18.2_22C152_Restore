@interface SXLayoutBlueprintProvider
- (SXLayoutBlueprint)blueprint;
- (void)setBlueprint:(id)a3;
- (void)updateBlueprint:(id)a3;
@end

@implementation SXLayoutBlueprintProvider

- (void)updateBlueprint:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = [(SXLayoutBlueprintProvider *)self blueprint];
    char v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(SXLayoutBlueprintProvider *)self setBlueprint:v6];
    }
  }
}

- (SXLayoutBlueprint)blueprint
{
  return self->blueprint;
}

- (void)setBlueprint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end