@interface W5AWDLStatus(Strings)
- (id)awdlElectionParametersString;
- (id)awdlMasterChannelString;
- (id)awdlOpModeString;
- (id)awdlScheduleString;
- (id)awdlSecondaryMasterChannelString;
- (id)awdlSyncChannelSequenceString;
- (id)awdlSyncStateString;
- (id)dictionary;
@end

@implementation W5AWDLStatus(Strings)

- (id)awdlOpModeString
{
  id v1 = a1;
  v2 = [a1 awdlOpMode];

  if (v2)
  {
    v3 = NSString;
    id v4 = [v1 awdlOpMode];
    unsigned int v5 = *(_DWORD *)([v4 bytes] + 4);
    if (v5 > 2)
    {
      v6 = "Unknown";
    }
    else
    {
      id v1 = [v1 awdlOpMode];
      v6 = awdlOpModeString_modestr_0[*(unsigned int *)([v1 bytes] + 4)];
    }
    v7 = objc_msgSend(v3, "stringWithFormat:", @"%s", v6);
    if (v5 <= 2) {
  }
    }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)awdlScheduleString
{
  v2 = [a1 awdlStrategy];

  if (v2)
  {
    id v3 = [a1 awdlStrategy];
    [v3 bytes];
    id v4 = W5DescriptionForAWDLScheduleState();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)awdlSyncChannelSequenceString
{
  v2 = [a1 awdlSyncChannelSequence];

  if (v2)
  {
    id v3 = [a1 awdlSyncChannelSequence];
    [v3 bytes];
    id v4 = W5DescriptionForAWDLSyncChannelSequence();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)awdlMasterChannelString
{
  v2 = [a1 awdlMasterChannel];

  if (v2)
  {
    id v3 = NSString;
    id v4 = [a1 awdlMasterChannel];
    unsigned int v5 = objc_msgSend(v3, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v4, "bytes") + 4));
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)awdlSecondaryMasterChannelString
{
  v2 = [a1 awdlSecondaryMasterChannel];

  if (v2)
  {
    id v3 = NSString;
    id v4 = [a1 awdlSecondaryMasterChannel];
    unsigned int v5 = objc_msgSend(v3, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v4, "bytes") + 4));
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)awdlSyncStateString
{
  v2 = [a1 awdlSyncState];

  if (v2)
  {
    id v3 = [a1 awdlSyncState];
    [v3 bytes];
    id v4 = W5DescriptionForAWDLSyncState();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)awdlElectionParametersString
{
  v2 = [a1 awdlElectionParameters];

  if (v2)
  {
    id v3 = NSString;
    id v4 = [a1 awdlElectionParameters];
    unsigned int v5 = objc_msgSend(v3, "stringWithFormat:", @"%i", *(unsigned int *)(objc_msgSend(v4, "bytes") + 32));
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)dictionary
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "power"));
  [v2 setObject:v3 forKeyedSubscript:@"awdl_power_state"];

  id v4 = [a1 awdlOpModeString];
  [v2 setObject:v4 forKeyedSubscript:@"awdl_op_mode"];

  unsigned int v5 = [a1 awdlScheduleString];
  [v2 setObject:v5 forKeyedSubscript:@"awdl_schedule"];

  v6 = [a1 awdlSyncChannelSequenceString];
  [v2 setObject:v6 forKeyedSubscript:@"awdl_sync_channel_sequence"];

  v7 = [a1 awdlMasterChannelString];
  [v2 setObject:v7 forKeyedSubscript:@"awdl_master_channel"];

  v8 = [a1 awdlSecondaryMasterChannelString];
  [v2 setObject:v8 forKeyedSubscript:@"awdl_secondary_master_channel"];

  v9 = [a1 awdlSyncStateString];
  [v2 setObject:v9 forKeyedSubscript:@"awdl_sync_state"];

  v10 = [a1 awdlElectionParametersString];
  [v2 setObject:v10 forKeyedSubscript:@"awdl_election_parameters"];

  v11 = [NSDictionary dictionaryWithDictionary:v2];

  return v11;
}

@end