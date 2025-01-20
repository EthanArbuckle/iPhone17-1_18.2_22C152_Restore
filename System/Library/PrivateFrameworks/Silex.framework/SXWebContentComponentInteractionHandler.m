@interface SXWebContentComponentInteractionHandler
- (SWInteraction)interaction;
- (SXWebContentComponentInteractionHandler)initWithInteraction:(id)a3;
- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
@end

@implementation SXWebContentComponentInteractionHandler

- (SXWebContentComponentInteractionHandler)initWithInteraction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebContentComponentInteractionHandler;
  v6 = [(SXWebContentComponentInteractionHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_interaction, a3);
  }

  return v7;
}

- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  id v5 = [(SXWebContentComponentInteractionHandler *)self interaction];
  [v5 perform];
}

- (SWInteraction)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
}

@end