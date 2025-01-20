@interface SearchUIBiomeEvent
+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4;
+ (id)eventForEvent:(id)a3 contextualAction:(id)a4;
- (BMEventBase)biomeEvent;
- (SearchUIBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4;
- (void)getEnabledStatusWithCompletion:(id)a3;
- (void)setBiomeEvent:(id)a3;
@end

@implementation SearchUIBiomeEvent

+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4
{
  return 1;
}

+ (id)eventForEvent:(id)a3 contextualAction:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)eventForEvent_contextualAction__classes;
  if (!eventForEvent_contextualAction__classes)
  {
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    v9 = (void *)eventForEvent_contextualAction__classes;
    eventForEvent_contextualAction__classes = v8;

    v7 = (void *)eventForEvent_contextualAction__classes;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v7;
  v11 = (void *)[v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(objc_class **)(*((void *)&v16 + 1) + 8 * i);
        if (-[objc_class supportsEvent:contextualAction:](v14, "supportsEvent:contextualAction:", v5, v6, (void)v16))
        {
          v11 = (void *)[[v14 alloc] initWithEvent:v5 contextualAction:v6];
          goto LABEL_13;
        }
      }
      v11 = (void *)[v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v11;
}

- (SearchUIBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBiomeEvent;
  id v6 = [(BMEventBase *)&v9 init];
  v7 = v6;
  if (v6) {
    [(SearchUIBiomeEvent *)v6 setBiomeEvent:v5];
  }

  return v7;
}

- (void)getEnabledStatusWithCompletion:(id)a3
{
  objc_super v9 = (void (**)(id, void))a3;
  uint64_t v4 = [(SearchUIBiomeEvent *)self biomeEvent];
  if (v4
    && (id v5 = (void *)v4,
        [(SearchUIBiomeEvent *)self biomeEvent],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    uint64_t v8 = [(SearchUIBiomeEvent *)self biomeEvent];
    [v8 getEnabledStatusWithCompletion:v9];
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (BMEventBase)biomeEvent
{
  return self->_biomeEvent;
}

- (void)setBiomeEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end