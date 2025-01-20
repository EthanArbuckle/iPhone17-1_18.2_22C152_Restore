@interface SiriSharedUIViewStack
- (BOOL)containsContentView:(id)a3;
- (NSArray)contentViews;
- (NSMutableOrderedSet)mutableViews;
- (SiriSharedUIStackableContent)mostRecentlyAddedView;
- (SiriSharedUIViewStack)initWithContentViews:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextViewAfterContentView:(id)a3;
- (id)previousViewBeforeContentView:(id)a3;
- (id)viewAtIndex:(int64_t)a3;
- (void)addContentView:(id)a3;
- (void)removeContentView:(id)a3;
- (void)reset;
- (void)setContentViews:(id)a3;
- (void)setMutableViews:(id)a3;
@end

@implementation SiriSharedUIViewStack

- (SiriSharedUIViewStack)initWithContentViews:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIViewStack;
  v5 = [(SiriSharedUIViewStack *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    mutableViews = v5->_mutableViews;
    v5->_mutableViews = v6;

    [(SiriSharedUIViewStack *)v5 setContentViews:v4];
  }

  return v5;
}

- (void)setContentViews:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9B0];
  id v5 = a3;
  v6 = (NSMutableOrderedSet *)[[v4 alloc] initWithArray:v5];

  mutableViews = self->_mutableViews;
  self->_mutableViews = v6;
}

- (NSArray)contentViews
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_mutableViews array];
}

- (void)addContentView:(id)a3
{
  id v4 = a3;
  if ([(SiriSharedUIViewStack *)self containsContentView:v4])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriSharedUIViewStack addContentView:]();
    }
  }
  else
  {
    [(NSMutableOrderedSet *)self->_mutableViews addObject:v4];
  }
}

- (void)removeContentView:(id)a3
{
  id v4 = a3;
  if ([(SiriSharedUIViewStack *)self containsContentView:v4])
  {
    [(NSMutableOrderedSet *)self->_mutableViews removeObject:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    -[SiriSharedUIViewStack removeContentView:]();
  }
}

- (BOOL)containsContentView:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableViews containsObject:a3];
}

- (id)nextViewAfterContentView:(id)a3
{
  unint64_t v4 = [(NSMutableOrderedSet *)self->_mutableViews indexOfObject:a3];
  if (v4 > 0x7FFFFFFFFFFFFFFELL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(SiriSharedUIViewStack *)self viewAtIndex:v4 + 1];
  }
  return v5;
}

- (id)viewAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    if ([(NSMutableOrderedSet *)self->_mutableViews count] <= (unint64_t)a3)
    {
      v6 = 0;
    }
    else
    {
      v6 = [(NSMutableOrderedSet *)self->_mutableViews objectAtIndex:a3];
    }
  }
  return v6;
}

- (id)previousViewBeforeContentView:(id)a3
{
  if ((unint64_t)([(NSMutableOrderedSet *)self->_mutableViews indexOfObject:a3] - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = -[SiriSharedUIViewStack viewAtIndex:](self, "viewAtIndex:");
  }
  return v4;
}

- (void)reset
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SiriSharedUIViewStack reset]";
    _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #viewStack Resetting items in SiriSharedUIViewStack", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableOrderedSet *)self->_mutableViews removeAllObjects];
}

- (SiriSharedUIStackableContent)mostRecentlyAddedView
{
  return (SiriSharedUIStackableContent *)[(NSMutableOrderedSet *)self->_mutableViews lastObject];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = [(SiriSharedUIViewStack *)self contentViews];
  id v5 = [+[SiriSharedUIViewStack allocWithZone:a3] initWithContentViews:v4];

  return v5;
}

- (NSMutableOrderedSet)mutableViews
{
  return self->_mutableViews;
}

- (void)setMutableViews:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)addContentView:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20C9D5000, v0, v1, "%s #viewStack Attempting to add view (%@) that already exists in %@", v2);
}

- (void)removeContentView:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20C9D5000, v0, v1, "%s #viewStack Attempting to remove view (%@) that doesn't even exist in %@", v2);
}

@end