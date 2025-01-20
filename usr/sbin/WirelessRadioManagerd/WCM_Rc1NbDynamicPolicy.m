@interface WCM_Rc1NbDynamicPolicy
- (BOOL)isEqual:(id)a3;
- (int)Rc1IssueChannel;
- (int)bandInfoType;
- (int)cellTxPowerCap_16th_dBm;
- (int)mitigationType;
- (int)nbChannelToAvoidEnd;
- (int)nbChannelToAvoidStart;
- (unint64_t)downlinkHighFreq_Hz;
- (unint64_t)downlinkLowFreq_Hz;
- (unint64_t)uplinkHighFreq_Hz;
- (unint64_t)uplinkLowFreq_Hz;
- (unsigned)Rc1AntBitmap;
- (unsigned)Rc1PriorityBitmap;
- (unsigned)cellAgressorAntBitmap;
- (unsigned)cellBand;
- (void)setBandInfoType:(int)a3;
- (void)setCellAgressorAntBitmap:(unsigned int)a3;
- (void)setCellBand:(unsigned int)a3;
- (void)setCellTxPowerCap_16th_dBm:(int)a3;
- (void)setDownlinkHighFreq_Hz:(unint64_t)a3;
- (void)setDownlinkLowFreq_Hz:(unint64_t)a3;
- (void)setMitigationType:(int)a3;
- (void)setNbChannelToAvoidEnd:(int)a3;
- (void)setNbChannelToAvoidStart:(int)a3;
- (void)setRc1AntBitmap:(unsigned int)a3;
- (void)setRc1IssueChannel:(int)a3;
- (void)setRc1PriorityBitmap:(unsigned int)a3;
- (void)setUplinkHighFreq_Hz:(unint64_t)a3;
- (void)setUplinkLowFreq_Hz:(unint64_t)a3;
@end

@implementation WCM_Rc1NbDynamicPolicy

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id uplinkLowFreq_Hz = self->_uplinkLowFreq_Hz;
    if (uplinkLowFreq_Hz != objc_msgSend(v6, "uplinkLowFreq_Hz")) {
      goto LABEL_13;
    }
    id uplinkHighFreq_Hz = self->_uplinkHighFreq_Hz;
    if (uplinkHighFreq_Hz != objc_msgSend(v6, "uplinkHighFreq_Hz")) {
      goto LABEL_13;
    }
    id downlinkLowFreq_Hz = self->_downlinkLowFreq_Hz;
    if (downlinkLowFreq_Hz != objc_msgSend(v6, "downlinkLowFreq_Hz")) {
      goto LABEL_13;
    }
    id downlinkHighFreq_Hz = self->_downlinkHighFreq_Hz;
    if (downlinkHighFreq_Hz == objc_msgSend(v6, "downlinkHighFreq_Hz")
      && (int nbChannelToAvoidStart = self->_nbChannelToAvoidStart,
          nbChannelToAvoidStart == [v6 nbChannelToAvoidStart])
      && (int nbChannelToAvoidEnd = self->_nbChannelToAvoidEnd,
          nbChannelToAvoidEnd == [v6 nbChannelToAvoidEnd])
      && (int Rc1IssueChannel = self->_Rc1IssueChannel, Rc1IssueChannel == [v6 Rc1IssueChannel])
      && (unsigned int Rc1AntBitmap = self->_Rc1AntBitmap, Rc1AntBitmap == [v6 Rc1AntBitmap])
      && (int mitigationType = self->_mitigationType, mitigationType == [v6 mitigationType])
      && (unsigned int cellAgressorAntBitmap = self->_cellAgressorAntBitmap,
          cellAgressorAntBitmap == [v6 cellAgressorAntBitmap]))
    {
      int cellTxPowerCap_16th_dBm = self->_cellTxPowerCap_16th_dBm;
      BOOL v18 = cellTxPowerCap_16th_dBm == [v6 cellTxPowerCap_16th_dBm];
    }
    else
    {
LABEL_13:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (int)bandInfoType
{
  return self->_bandInfoType;
}

- (void)setBandInfoType:(int)a3
{
  self->_bandInfoType = a3;
}

- (unsigned)cellBand
{
  return self->_cellBand;
}

- (void)setCellBand:(unsigned int)a3
{
  self->_cellBand = a3;
}

- (unint64_t)downlinkLowFreq_Hz
{
  return self->_downlinkLowFreq_Hz;
}

- (void)setDownlinkLowFreq_Hz:(unint64_t)a3
{
  self->_id downlinkLowFreq_Hz = a3;
}

- (unint64_t)downlinkHighFreq_Hz
{
  return self->_downlinkHighFreq_Hz;
}

- (void)setDownlinkHighFreq_Hz:(unint64_t)a3
{
  self->_id downlinkHighFreq_Hz = a3;
}

- (unint64_t)uplinkLowFreq_Hz
{
  return self->_uplinkLowFreq_Hz;
}

- (void)setUplinkLowFreq_Hz:(unint64_t)a3
{
  self->_id uplinkLowFreq_Hz = a3;
}

- (unint64_t)uplinkHighFreq_Hz
{
  return self->_uplinkHighFreq_Hz;
}

- (void)setUplinkHighFreq_Hz:(unint64_t)a3
{
  self->_id uplinkHighFreq_Hz = a3;
}

- (int)Rc1IssueChannel
{
  return self->_Rc1IssueChannel;
}

- (void)setRc1IssueChannel:(int)a3
{
  self->_int Rc1IssueChannel = a3;
}

- (unsigned)Rc1AntBitmap
{
  return self->_Rc1AntBitmap;
}

- (void)setRc1AntBitmap:(unsigned int)a3
{
  self->_unsigned int Rc1AntBitmap = a3;
}

- (unsigned)Rc1PriorityBitmap
{
  return self->_Rc1PriorityBitmap;
}

- (void)setRc1PriorityBitmap:(unsigned int)a3
{
  self->_Rc1PriorityBitmap = a3;
}

- (unsigned)cellAgressorAntBitmap
{
  return self->_cellAgressorAntBitmap;
}

- (void)setCellAgressorAntBitmap:(unsigned int)a3
{
  self->_unsigned int cellAgressorAntBitmap = a3;
}

- (int)cellTxPowerCap_16th_dBm
{
  return self->_cellTxPowerCap_16th_dBm;
}

- (void)setCellTxPowerCap_16th_dBm:(int)a3
{
  self->_int cellTxPowerCap_16th_dBm = a3;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (void)setMitigationType:(int)a3
{
  self->_int mitigationType = a3;
}

- (int)nbChannelToAvoidStart
{
  return self->_nbChannelToAvoidStart;
}

- (void)setNbChannelToAvoidStart:(int)a3
{
  self->_int nbChannelToAvoidStart = a3;
}

- (int)nbChannelToAvoidEnd
{
  return self->_nbChannelToAvoidEnd;
}

- (void)setNbChannelToAvoidEnd:(int)a3
{
  self->_int nbChannelToAvoidEnd = a3;
}

@end