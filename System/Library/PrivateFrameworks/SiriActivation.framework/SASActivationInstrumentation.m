@interface SASActivationInstrumentation
- (NSUUID)activationEventIdentifier;
- (SASActivationInstrumentation)initWithSender:(id)a3;
- (id)buttonDownWithIdentifier:(id)a3;
- (id)buttonTapWithIdentifier:(id)a3 associateWithButtonDown:(BOOL)a4;
- (id)buttonUpWithIdentifier:(id)a3;
- (void)_instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4;
- (void)setActivationEventIdentifier:(id)a3;
@end

@implementation SASActivationInstrumentation

- (SASActivationInstrumentation)initWithSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASActivationInstrumentation;
  v6 = [(SASActivationInstrumentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_instrumentationSender, a3);
  }

  return v7;
}

- (id)buttonDownWithIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(SASActivationInstrumentation *)self setActivationEventIdentifier:v6];

  [(SASActivationInstrumentation *)self _instrumentButtonInteractionType:1 buttonIdentifier:v5];
  return [(SASActivationInstrumentation *)self activationEventIdentifier];
}

- (id)buttonUpWithIdentifier:(id)a3
{
  [(SASActivationInstrumentation *)self _instrumentButtonInteractionType:2 buttonIdentifier:a3];
  return [(SASActivationInstrumentation *)self activationEventIdentifier];
}

- (id)buttonTapWithIdentifier:(id)a3 associateWithButtonDown:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [(SASActivationInstrumentation *)self setActivationEventIdentifier:v7];
  }
  [(SASActivationInstrumentation *)self _instrumentButtonInteractionType:3 buttonIdentifier:v6];
  v8 = [(SASActivationInstrumentation *)self activationEventIdentifier];

  return v8;
}

- (void)_instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  instrumentationSender = self->_instrumentationSender;
  id v7 = a4;
  id v8 = [(SASActivationInstrumentation *)self activationEventIdentifier];
  [(SASActivationInstrumentationSending *)instrumentationSender instrumentButtonInteractionType:v4 buttonIdentifier:v7 activationEventIdentifier:v8];
}

- (NSUUID)activationEventIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivationEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEventIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationSender, 0);
}

@end