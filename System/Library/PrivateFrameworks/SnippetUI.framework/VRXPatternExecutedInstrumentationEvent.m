@interface VRXPatternExecutedInstrumentationEvent
- (NSString)patternId;
- (NSString)patternType;
- (NSString)responseMode;
- (NSString)responseViewId;
- (VRXPatternExecutedInstrumentationEvent)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6;
- (_TtC9SnippetUI17RFPatternExecuted)patternExecuted;
- (id)init:(id)a3 patternType:(id)a4 responseMode:(id)a5;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
- (void)setPatternId:(id)a3;
- (void)setPatternType:(id)a3;
- (void)setResponseMode:(id)a3;
- (void)setResponseViewId:(id)a3;
@end

@implementation VRXPatternExecutedInstrumentationEvent

- (id)init:(id)a3 patternType:(id)a4 responseMode:(id)a5
{
  return [(VRXPatternExecutedInstrumentationEvent *)self initWithPatternId:a3 patternType:a4 responseViewId:0 responseMode:a5];
}

- (VRXPatternExecutedInstrumentationEvent)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VRXPatternExecutedInstrumentationEvent;
  v14 = [(VRXPatternExecutedInstrumentationEvent *)&v18 init];
  if (v14)
  {
    v15 = [[_TtC9SnippetUI17RFPatternExecuted alloc] initWithPatternId:v10 patternType:v11 responseViewId:v12 responseMode:v13];
    patternExecuted = v14->_patternExecuted;
    v14->_patternExecuted = v15;
  }
  return v14;
}

- (NSString)patternId
{
  return [(RFPatternExecuted *)self->_patternExecuted patternId];
}

- (NSString)patternType
{
  return [(RFPatternExecuted *)self->_patternExecuted patternType];
}

- (NSString)responseMode
{
  return [(RFPatternExecuted *)self->_patternExecuted responseMode];
}

- (void)emitWithTurnIdentifier:(id)a3
{
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
}

- (void)setPatternId:(id)a3
{
}

- (void)setPatternType:(id)a3
{
}

- (NSString)responseViewId
{
  return self->_responseViewId;
}

- (void)setResponseViewId:(id)a3
{
}

- (void)setResponseMode:(id)a3
{
}

- (_TtC9SnippetUI17RFPatternExecuted)patternExecuted
{
  return (_TtC9SnippetUI17RFPatternExecuted *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternExecuted, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_responseViewId, 0);
  objc_storeStrong((id *)&self->_patternType, 0);

  objc_storeStrong((id *)&self->_patternId, 0);
}

@end