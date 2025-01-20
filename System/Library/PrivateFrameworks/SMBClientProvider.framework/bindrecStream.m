@interface bindrecStream
- (BOOL)in_lastfrag;
- (bindrecStream)init;
- (char)in_base;
- (char)out_base;
- (char)sec_addr;
- (ndr_fmt_label)in_ndr;
- (transportCtx)tctx;
- (unsigned)assoc_group_id;
- (unsigned)call_id;
- (unsigned)in_fbtbd;
- (unsigned)in_finger;
- (unsigned)in_len;
- (unsigned)in_max_recv_frag;
- (unsigned)in_max_xmit_frag;
- (unsigned)negotiated_max_recv_frag;
- (unsigned)negotiated_max_xmit_frag;
- (unsigned)out_finger;
- (unsigned)recv_size;
- (unsigned)sec_addr_len;
- (unsigned)send_size;
- (void)dealloc;
- (void)setAssoc_group_id:(unsigned int)a3;
- (void)setCall_id:(unsigned int)a3;
- (void)setIn_base:(char *)a3;
- (void)setIn_fbtbd:(unsigned int)a3;
- (void)setIn_finger:(unsigned int)a3;
- (void)setIn_lastfrag:(BOOL)a3;
- (void)setIn_len:(unsigned int)a3;
- (void)setIn_max_recv_frag:(unsigned __int16)a3;
- (void)setIn_max_xmit_frag:(unsigned __int16)a3;
- (void)setIn_ndr:(ndr_fmt_label)a3;
- (void)setNegotiated_max_recv_frag:(unsigned __int16)a3;
- (void)setNegotiated_max_xmit_frag:(unsigned __int16)a3;
- (void)setOut_base:(char *)a3;
- (void)setOut_finger:(unsigned int)a3;
- (void)setRecv_size:(unsigned int)a3;
- (void)setSec_addr:(char *)a3;
- (void)setSec_addr_len:(unsigned int)a3;
- (void)setSend_size:(unsigned int)a3;
- (void)setTctx:(id)a3;
@end

@implementation bindrecStream

- (bindrecStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)bindrecStream;
  v2 = [(bindrecStream *)&v6 init];
  v3 = v2;
  if (v2)
  {
    tctx = v2->_tctx;
    v2->_tctx = 0;

    v3->_sec_addr = 0;
  }
  return v3;
}

- (void)dealloc
{
  if ([(bindrecStream *)self in_base]) {
    free([(bindrecStream *)self in_base]);
  }
  if ([(bindrecStream *)self out_base]) {
    free([(bindrecStream *)self out_base]);
  }
  if ([(bindrecStream *)self sec_addr]) {
    free([(bindrecStream *)self sec_addr]);
  }
  v3.receiver = self;
  v3.super_class = (Class)bindrecStream;
  [(bindrecStream *)&v3 dealloc];
}

- (transportCtx)tctx
{
  return (transportCtx *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTctx:(id)a3
{
}

- (unsigned)send_size
{
  return self->_send_size;
}

- (void)setSend_size:(unsigned int)a3
{
  self->_send_size = a3;
}

- (unsigned)recv_size
{
  return self->_recv_size;
}

- (void)setRecv_size:(unsigned int)a3
{
  self->_recv_size = a3;
}

- (unsigned)call_id
{
  return self->_call_id;
}

- (void)setCall_id:(unsigned int)a3
{
  self->_call_id = a3;
}

- (char)out_base
{
  return self->_out_base;
}

- (void)setOut_base:(char *)a3
{
  self->_out_base = a3;
}

- (unsigned)out_finger
{
  return self->_out_finger;
}

- (void)setOut_finger:(unsigned int)a3
{
  self->_out_finger = a3;
}

- (char)in_base
{
  return self->_in_base;
}

- (void)setIn_base:(char *)a3
{
  self->_in_base = a3;
}

- (unsigned)in_len
{
  return self->_in_len;
}

- (void)setIn_len:(unsigned int)a3
{
  self->_in_len = a3;
}

- (unsigned)in_finger
{
  return self->_in_finger;
}

- (void)setIn_finger:(unsigned int)a3
{
  self->_in_finger = a3;
}

- (unsigned)in_fbtbd
{
  return self->_in_fbtbd;
}

- (void)setIn_fbtbd:(unsigned int)a3
{
  self->_in_fbtbd = a3;
}

- (BOOL)in_lastfrag
{
  return self->_in_lastfrag;
}

- (void)setIn_lastfrag:(BOOL)a3
{
  self->_in_lastfrag = a3;
}

- (ndr_fmt_label)in_ndr
{
  objc_copyStruct(&dest, &self->_in_ndr, 4, 1, 0);
  return dest;
}

- (void)setIn_ndr:(ndr_fmt_label)a3
{
  ndr_fmt_label src = a3;
  objc_copyStruct(&self->_in_ndr, &src, 4, 1, 0);
}

- (unsigned)in_max_xmit_frag
{
  return self->_in_max_xmit_frag;
}

- (void)setIn_max_xmit_frag:(unsigned __int16)a3
{
  self->_in_max_xmit_frag = a3;
}

- (unsigned)in_max_recv_frag
{
  return self->_in_max_recv_frag;
}

- (void)setIn_max_recv_frag:(unsigned __int16)a3
{
  self->_in_max_recv_frag = a3;
}

- (unsigned)negotiated_max_xmit_frag
{
  return self->_negotiated_max_xmit_frag;
}

- (void)setNegotiated_max_xmit_frag:(unsigned __int16)a3
{
  self->_negotiated_max_xmit_frag = a3;
}

- (unsigned)negotiated_max_recv_frag
{
  return self->_negotiated_max_recv_frag;
}

- (void)setNegotiated_max_recv_frag:(unsigned __int16)a3
{
  self->_negotiated_max_recv_frag = a3;
}

- (unsigned)assoc_group_id
{
  return self->_assoc_group_id;
}

- (void)setAssoc_group_id:(unsigned int)a3
{
  self->_assoc_group_id = a3;
}

- (unsigned)sec_addr_len
{
  return self->_sec_addr_len;
}

- (void)setSec_addr_len:(unsigned int)a3
{
  self->_sec_addr_len = a3;
}

- (char)sec_addr
{
  return self->_sec_addr;
}

- (void)setSec_addr:(char *)a3
{
  self->_sec_addr = a3;
}

- (void).cxx_destruct
{
}

@end