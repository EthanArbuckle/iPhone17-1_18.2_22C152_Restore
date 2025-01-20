@interface _LTServerEndpointerFeatures(Daemon)
+ (id)featuresForEndpointer:()Daemon;
- (id)initWithResponse:()Daemon;
@end

@implementation _LTServerEndpointerFeatures(Daemon)

- (id)initWithResponse:()Daemon
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&off_270C58A20;
  id v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v5, "setWordCount:", (int)objc_msgSend(v4, "num_of_words"));
    objc_msgSend(v5, "setTrailingSilenceDuration:", (int)objc_msgSend(v4, "trailing_silence_duration"));
    objc_msgSend(v4, "eos_likelihood");
    objc_msgSend(v5, "setEosLikelihood:");
    v6 = objc_msgSend(v4, "pause_counts");
    [v5 setPauseCounts:v6];

    objc_msgSend(v4, "silence_posterior");
    objc_msgSend(v5, "setSilencePosterior:");
    objc_msgSend(v5, "setProcessedAudioDurationInMilliseconds:", (int)objc_msgSend(v4, "processed_audio_duration_ms"));
    id v7 = v5;
  }

  return v5;
}

+ (id)featuresForEndpointer:()Daemon
{
  v3 = [a3 defaultServerEndpointFeatures];
  id v4 = objc_alloc_init(MEMORY[0x263F1C110]);
  objc_msgSend(v4, "setWordCount:", objc_msgSend(v3, "wordCount"));
  objc_msgSend(v4, "setTrailingSilenceDuration:", objc_msgSend(v3, "trailingSilenceDuration"));
  [v3 endOfSentenceLikelihood];
  [v4 setEosLikelihood:v5];
  [v4 setPauseCounts:MEMORY[0x263EFFA68]];
  [v3 silencePosterior];
  [v4 setSilencePosterior:v6];
  [v4 setProcessedAudioDurationInMilliseconds:0];

  return v4;
}

@end