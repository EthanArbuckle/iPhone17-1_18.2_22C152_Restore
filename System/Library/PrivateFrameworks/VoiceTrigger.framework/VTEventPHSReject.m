@interface VTEventPHSReject
- (id)_buildContent;
- (id)_buildDetail;
- (id)_buildTitle;
@end

@implementation VTEventPHSReject

- (id)_buildDetail
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(VTEvent *)self _packAudioURLFromVTEventInfo:@"Audio Play" key:@"captureFilePath"];
  [v3 addObject:v4];

  v5 = [(VTEvent *)self _packStringContent:@"Type" value:@"PHS Rejected"];
  [v3 addObject:v5];

  v8.receiver = self;
  v8.super_class = (Class)VTEventPHSReject;
  v6 = [(VTEvent *)&v8 _buildTriggerDetail];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)_buildContent
{
  v4.receiver = self;
  v4.super_class = (Class)VTEventPHSReject;
  v2 = [(VTEvent *)&v4 _buildTriggerContent];

  return v2;
}

- (id)_buildTitle
{
  v2 = NSString;
  v3 = [(VTEvent *)self timestampString];
  objc_super v4 = [v2 stringWithFormat:@"PHS Reject : %@", v3];

  return v4;
}

@end