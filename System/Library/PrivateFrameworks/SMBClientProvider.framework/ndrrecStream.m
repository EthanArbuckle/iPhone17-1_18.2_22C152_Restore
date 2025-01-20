@interface ndrrecStream
- (BOOL)in_lastfrag;
- (BOOL)out_first_frag_sent;
- (char)in_base;
- (char)out_base;
- (ndr_fmt_label)in_ndr;
- (ndrrecStream)init;
- (transportCtx)tctx;
- (unsigned)assoc_group_id;
- (unsigned)call_id_counter;
- (unsigned)context_id;
- (unsigned)in_fbtbc;
- (unsigned)in_finger;
- (unsigned)in_len;
- (unsigned)opnum;
- (unsigned)out_finger;
- (unsigned)recv_size;
- (unsigned)send_size;
- (void)dealloc;
- (void)setAssoc_group_id:(unsigned int)a3;
- (void)setCall_id_counter:(unsigned int)a3;
- (void)setContext_id:(unsigned __int16)a3;
- (void)setIn_base:(char *)a3;
- (void)setIn_fbtbc:(unsigned int)a3;
- (void)setIn_finger:(unsigned int)a3;
- (void)setIn_lastfrag:(BOOL)a3;
- (void)setIn_len:(unsigned int)a3;
- (void)setIn_ndr:(ndr_fmt_label)a3;
- (void)setOpnum:(unsigned __int16)a3;
- (void)setOut_base:(char *)a3;
- (void)setOut_finger:(unsigned int)a3;
- (void)setOut_first_frag_sent:(BOOL)a3;
- (void)setRecv_size:(unsigned int)a3;
- (void)setSend_size:(unsigned int)a3;
- (void)setTctx:(id)a3;
@end

@implementation ndrrecStream

- (ndrrecStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)ndrrecStream;
  v2 = [(ndrrecStream *)&v6 init];
  v3 = v2;
  if (v2)
  {
    tctx = v2->_tctx;
    v2->_tctx = 0;

    v3->_out_base = 0;
    v3->_in_base = 0;
  }
  return v3;
}

- (void)dealloc
{
  if ([(ndrrecStream *)self out_base]) {
    free([(ndrrecStream *)self out_base]);
  }
  if ([(ndrrecStream *)self in_base]) {
    free([(ndrrecStream *)self in_base]);
  }
  [(ndrrecStream *)self setTctx:0];
  v3.receiver = self;
  v3.super_class = (Class)ndrrecStream;
  [(ndrrecStream *)&v3 dealloc];
}

- (transportCtx)tctx
{
  return (transportCtx *)objc_getProperty(self, a2, 56, 1);
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

- (unsigned)opnum
{
  return self->_opnum;
}

- (void)setOpnum:(unsigned __int16)a3
{
  self->_opnum = a3;
}

- (unsigned)call_id_counter
{
  return self->_call_id_counter;
}

- (void)setCall_id_counter:(unsigned int)a3
{
  self->_call_id_counter = a3;
}

- (unsigned)assoc_group_id
{
  return self->_assoc_group_id;
}

- (void)setAssoc_group_id:(unsigned int)a3
{
  self->_assoc_group_id = a3;
}

- (unsigned)context_id
{
  return self->_context_id;
}

- (void)setContext_id:(unsigned __int16)a3
{
  self->_context_id = a3;
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

- (BOOL)out_first_frag_sent
{
  return self->_out_first_frag_sent;
}

- (void)setOut_first_frag_sent:(BOOL)a3
{
  self->_out_first_frag_sent = a3;
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

- (unsigned)in_fbtbc
{
  return self->_in_fbtbc;
}

- (void)setIn_fbtbc:(unsigned int)a3
{
  self->_in_fbtbc = a3;
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

- (void).cxx_destruct
{
}

@end