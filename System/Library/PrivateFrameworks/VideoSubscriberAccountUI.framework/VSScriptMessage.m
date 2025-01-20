@interface VSScriptMessage
- (NSString)body;
- (VSScriptSecurityOrigin)source;
- (VSScriptSecurityOrigin)target;
- (id)description;
- (void)setBody:(id)a3;
- (void)setSource:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation VSScriptMessage

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VSScriptMessage;
  v4 = [(VSScriptMessage *)&v10 description];
  v5 = [(VSScriptMessage *)self source];
  v6 = [(VSScriptMessage *)self target];
  v7 = [(VSScriptMessage *)self body];
  v8 = [v3 stringWithFormat:@"<%@ From:%@ To:%@ Body:%@>", v4, v5, v6, v7];

  return v8;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (VSScriptSecurityOrigin)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (VSScriptSecurityOrigin)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end