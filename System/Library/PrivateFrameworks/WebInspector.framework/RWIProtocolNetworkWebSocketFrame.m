@interface RWIProtocolNetworkWebSocketFrame
- (BOOL)mask;
- (NSString)payloadData;
- (RWIProtocolNetworkWebSocketFrame)initWithOpcode:(double)a3 mask:(BOOL)a4 payloadData:(id)a5 payloadLength:(double)a6;
- (double)opcode;
- (double)payloadLength;
- (void)setMask:(BOOL)a3;
- (void)setOpcode:(double)a3;
- (void)setPayloadData:(id)a3;
- (void)setPayloadLength:(double)a3;
@end

@implementation RWIProtocolNetworkWebSocketFrame

- (RWIProtocolNetworkWebSocketFrame)initWithOpcode:(double)a3 mask:(BOOL)a4 payloadData:(id)a5 payloadLength:(double)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  v11 = [(RWIProtocolJSONObject *)&v14 init];
  if (v11)
  {
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"payloadData" format];
    }
    [(RWIProtocolNetworkWebSocketFrame *)v11 setOpcode:a3];
    [(RWIProtocolNetworkWebSocketFrame *)v11 setMask:v7];
    [(RWIProtocolNetworkWebSocketFrame *)v11 setPayloadData:v10];
    [(RWIProtocolNetworkWebSocketFrame *)v11 setPayloadLength:a6];
    v12 = v11;
  }

  return v11;
}

- (void)setOpcode:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"opcode" forKey:a3];
}

- (double)opcode
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"opcode"];
  return result;
}

- (void)setMask:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"mask"];
}

- (BOOL)mask
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"mask"];
}

- (void)setPayloadData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"payloadData"];
}

- (NSString)payloadData
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"payloadData"];
  return (NSString *)v2;
}

- (void)setPayloadLength:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"payloadLength" forKey:a3];
}

- (double)payloadLength
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"payloadLength"];
  return result;
}

@end