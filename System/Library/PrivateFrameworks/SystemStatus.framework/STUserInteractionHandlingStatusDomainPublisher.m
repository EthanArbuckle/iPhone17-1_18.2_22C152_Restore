@interface STUserInteractionHandlingStatusDomainPublisher
- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4;
- (void)handleUserInteractionsWithBlock:(id)a3;
@end

@implementation STUserInteractionHandlingStatusDomainPublisher

- (void)handleUserInteractionsWithBlock:(id)a3
{
  v4 = (char *)a3;
  v5 = v4;
  if (self && self->_userInteractionHandlerBlock != v4)
  {
    v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 24);
    v5 = v6;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v8 = a3;
  if (![(STStatusDomainPublisher *)self isInvalidated]
    && [(id)objc_opt_class() statusDomainName] == a4)
  {
    if (self)
    {
      id v6 = self->_userInteractionHandlerBlock;
      if (v6)
      {
        v7 = v6;
        (*((void (**)(id, id))v6 + 2))(v6, v8);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end