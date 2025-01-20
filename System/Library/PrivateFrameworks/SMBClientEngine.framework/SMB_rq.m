@interface SMB_rq
- (NSData)writeData;
- (SMBPiston)sr_pd;
- (SMB_rq)sr_next_rqp;
- (char)sr_rqsigp;
- (id)sr_callback;
- (int)replyError;
- (mbchain)smb_rq_getrequest;
- (mdchain)smb_rq_getreply;
- (smb_session)sr_sessionp;
- (timespec)sr_credit_timesent;
- (timespec)sr_timesent;
- (unint64_t)sr_messageid;
- (unint64_t)sr_messageidp;
- (unint64_t)sr_rqsessionid;
- (unint64_t)sr_rspasyncid;
- (unint64_t)sr_rspsessionid;
- (unsigned)onEncryptedShare;
- (unsigned)sr_bcount;
- (unsigned)sr_command;
- (unsigned)sr_creditcharge;
- (unsigned)sr_creditchargep;
- (unsigned)sr_creditreqp;
- (unsigned)sr_creditsrequested;
- (unsigned)sr_extflags;
- (unsigned)sr_flags;
- (unsigned)sr_flagsp;
- (unsigned)sr_lcount;
- (unsigned)sr_nextcmd;
- (unsigned)sr_nextcmdp;
- (unsigned)sr_ntstatus;
- (unsigned)sr_rqflags;
- (unsigned)sr_rqtreeid;
- (unsigned)sr_rspcreditsgranted;
- (unsigned)sr_rspflags;
- (unsigned)sr_rspnextcmd;
- (unsigned)sr_rsppid;
- (unsigned)sr_rsptreeid;
- (unsigned)sr_timeout;
- (unsigned)writeLen;
- (void)dealloc;
- (void)setOnEncryptedShare:(unsigned int)a3;
- (void)setReplyError:(int)a3;
- (void)setSr_bcount:(unsigned __int16 *)a3;
- (void)setSr_callback:(id)a3;
- (void)setSr_command:(unsigned __int16)a3;
- (void)setSr_credit_timesent:(timespec)a3;
- (void)setSr_creditcharge:(unsigned __int16)a3;
- (void)setSr_creditchargep:(unsigned __int16 *)a3;
- (void)setSr_creditreqp:(unsigned __int16 *)a3;
- (void)setSr_creditsrequested:(unsigned __int16)a3;
- (void)setSr_extflags:(unsigned int)a3;
- (void)setSr_flags:(unsigned int)a3;
- (void)setSr_flagsp:(unsigned int *)a3;
- (void)setSr_lcount:(unsigned int *)a3;
- (void)setSr_messageid:(unint64_t)a3;
- (void)setSr_messageidp:(unint64_t *)a3;
- (void)setSr_next_rqp:(id)a3;
- (void)setSr_nextcmd:(unsigned int)a3;
- (void)setSr_nextcmdp:(unsigned int *)a3;
- (void)setSr_ntstatus:(unsigned int)a3;
- (void)setSr_pd:(id)a3;
- (void)setSr_rqflags:(unsigned int)a3;
- (void)setSr_rqsessionid:(unint64_t)a3;
- (void)setSr_rqsigp:(char *)a3;
- (void)setSr_rqtreeid:(unsigned int)a3;
- (void)setSr_rspasyncid:(unint64_t)a3;
- (void)setSr_rspcreditsgranted:(unsigned __int16)a3;
- (void)setSr_rspflags:(unsigned int)a3;
- (void)setSr_rspnextcmd:(unsigned int)a3;
- (void)setSr_rsppid:(unsigned int)a3;
- (void)setSr_rspsessionid:(unint64_t)a3;
- (void)setSr_rsptreeid:(unsigned int)a3;
- (void)setSr_sessionp:(smb_session *)a3;
- (void)setSr_timeout:(unsigned int)a3;
- (void)setSr_timesent:(timespec)a3;
- (void)setWriteData:(id)a3;
- (void)setWriteLen:(unsigned int)a3;
- (void)smb_rq_callback:(int)a3;
- (void)smb_rq_done;
- (void)smb_rq_set_extflag:(unsigned int)a3;
- (void)smb_rq_set_sr_nextcmdp:(unint64_t)a3;
- (void)smb_rq_set_srflags:(unsigned int)a3;
- (void)smb_rq_set_srflagsp:(unsigned int)a3;
@end

@implementation SMB_rq

- (void)dealloc
{
  mb_done(&self->sr_rp);
  md_done(&self->sr_rq);
  v3.receiver = self;
  v3.super_class = (Class)SMB_rq;
  [(SMB_rq *)&v3 dealloc];
}

- (void)smb_rq_callback:(int)a3
{
  sr_callback = (void (**)(id, void))self->_sr_callback;
  if (sr_callback)
  {
    sr_callback[2](sr_callback, *(void *)&a3);
    id v5 = self->_sr_callback;
    self->_sr_callback = 0;
  }
}

- (void)smb_rq_done
{
  if ((self->_sr_extflags & 5) == 1 && (self->_sr_flags & 0x10) == 0)
  {
    self->_sr_rspcreditsgranted = self->_sr_creditcharge;
    smb2_rq_credit_increment(self);
  }
  mb_done(&self->sr_rp);
  md_done(&self->sr_rq);
  [(SMB_rq *)self setSr_callback:0];
}

- (mdchain)smb_rq_getreply
{
  return &self->sr_rp;
}

- (mbchain)smb_rq_getrequest
{
  return &self->sr_rq;
}

- (void)smb_rq_set_extflag:(unsigned int)a3
{
  self->_sr_extflags |= a3;
}

- (void)smb_rq_set_sr_nextcmdp:(unint64_t)a3
{
  *self->_sr_nextcmdp = LODWORD(self->sr_rq.mb_len) + a3;
}

- (void)smb_rq_set_srflags:(unsigned int)a3
{
  self->_sr_flags |= a3;
}

- (void)smb_rq_set_srflagsp:(unsigned int)a3
{
  *self->_sr_flagsp |= a3;
}

- (SMBPiston)sr_pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSr_pd:(id)a3
{
}

- (unsigned)sr_command
{
  return self->_sr_command;
}

- (void)setSr_command:(unsigned __int16)a3
{
  self->_sr_command = a3;
}

- (unsigned)sr_extflags
{
  return self->_sr_extflags;
}

- (void)setSr_extflags:(unsigned int)a3
{
  self->_sr_extflags = a3;
}

- (unsigned)sr_creditcharge
{
  return self->_sr_creditcharge;
}

- (void)setSr_creditcharge:(unsigned __int16)a3
{
  self->_sr_creditcharge = a3;
}

- (unsigned)sr_creditsrequested
{
  return self->_sr_creditsrequested;
}

- (void)setSr_creditsrequested:(unsigned __int16)a3
{
  self->_sr_creditsrequested = a3;
}

- (unsigned)sr_rqflags
{
  return self->_sr_rqflags;
}

- (void)setSr_rqflags:(unsigned int)a3
{
  self->_sr_rqflags = a3;
}

- (unsigned)sr_nextcmd
{
  return self->_sr_nextcmd;
}

- (void)setSr_nextcmd:(unsigned int)a3
{
  self->_sr_nextcmd = a3;
}

- (unint64_t)sr_messageid
{
  return self->_sr_messageid;
}

- (void)setSr_messageid:(unint64_t)a3
{
  self->_sr_messageid = a3;
}

- (unint64_t)sr_messageidp
{
  return self->_sr_messageidp;
}

- (void)setSr_messageidp:(unint64_t *)a3
{
  self->_sr_messageidp = a3;
}

- (unsigned)sr_rqtreeid
{
  return self->_sr_rqtreeid;
}

- (void)setSr_rqtreeid:(unsigned int)a3
{
  self->_sr_rqtreeid = a3;
}

- (unint64_t)sr_rqsessionid
{
  return self->_sr_rqsessionid;
}

- (void)setSr_rqsessionid:(unint64_t)a3
{
  self->_sr_rqsessionid = a3;
}

- (unsigned)sr_bcount
{
  return self->_sr_bcount;
}

- (void)setSr_bcount:(unsigned __int16 *)a3
{
  self->_sr_bcount = a3;
}

- (unsigned)sr_lcount
{
  return self->_sr_lcount;
}

- (void)setSr_lcount:(unsigned int *)a3
{
  self->_sr_lcount = a3;
}

- (unsigned)sr_creditchargep
{
  return self->_sr_creditchargep;
}

- (void)setSr_creditchargep:(unsigned __int16 *)a3
{
  self->_sr_creditchargep = a3;
}

- (unsigned)sr_creditreqp
{
  return self->_sr_creditreqp;
}

- (void)setSr_creditreqp:(unsigned __int16 *)a3
{
  self->_sr_creditreqp = a3;
}

- (unsigned)sr_flagsp
{
  return self->_sr_flagsp;
}

- (void)setSr_flagsp:(unsigned int *)a3
{
  self->_sr_flagsp = a3;
}

- (unsigned)sr_nextcmdp
{
  return self->_sr_nextcmdp;
}

- (void)setSr_nextcmdp:(unsigned int *)a3
{
  self->_sr_nextcmdp = a3;
}

- (unsigned)sr_flags
{
  return self->_sr_flags;
}

- (void)setSr_flags:(unsigned int)a3
{
  self->_sr_flags = a3;
}

- (char)sr_rqsigp
{
  return self->_sr_rqsigp;
}

- (void)setSr_rqsigp:(char *)a3
{
  self->_sr_rqsigp = a3;
}

- (unsigned)sr_timeout
{
  return self->_sr_timeout;
}

- (void)setSr_timeout:(unsigned int)a3
{
  self->_sr_timeout = a3;
}

- (timespec)sr_credit_timesent
{
  objc_copyStruct(v4, &self->_sr_credit_timesent, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setSr_credit_timesent:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_sr_credit_timesent, &v3, 16, 1, 0);
}

- (timespec)sr_timesent
{
  objc_copyStruct(v4, &self->_sr_timesent, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setSr_timesent:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_sr_timesent, &v3, 16, 1, 0);
}

- (unsigned)sr_rspcreditsgranted
{
  return self->_sr_rspcreditsgranted;
}

- (void)setSr_rspcreditsgranted:(unsigned __int16)a3
{
  self->_sr_rspcreditsgranted = a3;
}

- (unsigned)sr_rspflags
{
  return self->_sr_rspflags;
}

- (void)setSr_rspflags:(unsigned int)a3
{
  self->_sr_rspflags = a3;
}

- (unsigned)sr_rspnextcmd
{
  return self->_sr_rspnextcmd;
}

- (void)setSr_rspnextcmd:(unsigned int)a3
{
  self->_sr_rspnextcmd = a3;
}

- (unsigned)sr_rsppid
{
  return self->_sr_rsppid;
}

- (void)setSr_rsppid:(unsigned int)a3
{
  self->_sr_rsppid = a3;
}

- (unsigned)sr_rsptreeid
{
  return self->_sr_rsptreeid;
}

- (void)setSr_rsptreeid:(unsigned int)a3
{
  self->_sr_rsptreeid = a3;
}

- (unint64_t)sr_rspasyncid
{
  return self->_sr_rspasyncid;
}

- (void)setSr_rspasyncid:(unint64_t)a3
{
  self->_sr_rspasyncid = a3;
}

- (unint64_t)sr_rspsessionid
{
  return self->_sr_rspsessionid;
}

- (void)setSr_rspsessionid:(unint64_t)a3
{
  self->_sr_rspsessionid = a3;
}

- (int)replyError
{
  return self->_replyError;
}

- (void)setReplyError:(int)a3
{
  self->_replyError = a3;
}

- (smb_session)sr_sessionp
{
  return self->_sr_sessionp;
}

- (void)setSr_sessionp:(smb_session *)a3
{
  self->_sr_sessionp = a3;
}

- (unsigned)sr_ntstatus
{
  return self->_sr_ntstatus;
}

- (void)setSr_ntstatus:(unsigned int)a3
{
  self->_sr_ntstatus = a3;
}

- (SMB_rq)sr_next_rqp
{
  return (SMB_rq *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSr_next_rqp:(id)a3
{
}

- (id)sr_callback
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setSr_callback:(id)a3
{
}

- (unsigned)onEncryptedShare
{
  return self->_onEncryptedShare;
}

- (void)setOnEncryptedShare:(unsigned int)a3
{
  self->_onEncryptedShare = a3;
}

- (NSData)writeData
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setWriteData:(id)a3
{
}

- (unsigned)writeLen
{
  return self->_writeLen;
}

- (void)setWriteLen:(unsigned int)a3
{
  self->_writeLen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeData, 0);
  objc_storeStrong(&self->_sr_callback, 0);
  objc_storeStrong((id *)&self->_sr_next_rqp, 0);
  objc_storeStrong((id *)&self->_sr_pd, 0);
}

@end