@interface UISymbolEffectCompletionContext
- (BOOL)isFinished;
- (NSSymbolContentTransition)contentTransition;
- (NSSymbolEffect)effect;
- (id)sender;
- (void)setContentTransition:(id)a3;
- (void)setEffect:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setSender:(id)a3;
@end

@implementation UISymbolEffectCompletionContext

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);
  return WeakRetained;
}

- (void)setSender:(id)a3
{
}

- (NSSymbolEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (NSSymbolContentTransition)contentTransition
{
  return self->_contentTransition;
}

- (void)setContentTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTransition, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_destroyWeak(&self->_sender);
}

@end