@interface SBSSystemNotesTakeScreenshotResult
- (BSMachPortSendRight)machPortSendRight;
- (FBSDisplayIdentity)displayIdentity;
- (SBSSystemNotesTakeScreenshotResult)initWithDisplay:(id)a3 sendRight:(id)a4 scale:(double)a5;
- (SBSSystemNotesTakeScreenshotResult)initWithXPCDictionary:(id)a3;
- (double)scale;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSSystemNotesTakeScreenshotResult

- (SBSSystemNotesTakeScreenshotResult)initWithDisplay:(id)a3 sendRight:(id)a4 scale:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesTakeScreenshotResult;
  v11 = [(SBSSystemNotesTakeScreenshotResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayIdentity, a3);
    objc_storeStrong((id *)&v12->_machPortSendRight, a4);
    v12->_scale = a5;
  }

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
  }
}

- (SBSSystemNotesTakeScreenshotResult)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v6 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  double v8 = v7;

  id v9 = [(SBSSystemNotesTakeScreenshotResult *)self initWithDisplay:v5 sendRight:v6 scale:v8];
  return v9;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BSMachPortSendRight)machPortSendRight
{
  return self->_machPortSendRight;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machPortSendRight, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end