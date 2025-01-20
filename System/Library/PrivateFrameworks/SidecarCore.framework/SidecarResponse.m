@interface SidecarResponse
- (void)accept;
- (void)sendItems:(id)a3;
@end

@implementation SidecarResponse

- (void)sendItems:(id)a3
{
}

- (void)accept
{
  v5[2] = *MEMORY[0x263EF8340];
  if ((atomic_exchange((atomic_uchar *volatile)&self->_accepted, 1u) & 1) == 0)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    SidecarMessageSetType(v3, 2);
    v4 = [(SidecarRequest *)self uuid];
    v5[0] = 0;
    v5[1] = 0;
    [v4 getUUIDBytes:v5];
    SidecarMessageSetRequestID(v3, bswap32(v5[0]));

    [(SidecarRequest *)self _sendMessage:v3];
  }
}

@end